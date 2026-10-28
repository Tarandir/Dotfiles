#!/bin/bash
if pgrep -x gphoto2 >/dev/null; then
    echo '{"text":"󰄀   ON","class":"on","tooltip":"Webcam on (click to stop)"}'
else
    echo '{"text":"󰄀   OFF","class":"off","tooltip":"Webcam off (click to start)"}'
fi