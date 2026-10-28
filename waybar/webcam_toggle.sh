#!/bin/bash
DEV=/dev/video2

if pgrep -x gphoto2 >/dev/null; then
    # stop: end gphoto2 first so ffmpeg gets EOF, then make the camera leave live view
    pkill -x gphoto2
    sleep 1
    pkill -f "ffmpeg.*$DEV"
    gphoto2 --set-config viewfinder=0 2>/dev/null
else
    # start: make sure gvfs isn't holding the camera
    pkill -f gvfs-gphoto2-volume-monitor
    pkill -f gvfsd-gphoto2
    sleep 0.5
    setsid sh -c "gphoto2 --stdout --capture-movie | ffmpeg -loglevel error -i - -vcodec rawvideo -pix_fmt yuv420p -threads 0 -f v4l2 $DEV" >/tmp/webcam.log 2>&1 &
    sleep 2
fi

pkill -RTMIN+11 waybar