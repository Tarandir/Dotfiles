#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
#PS1='[\u@\h \W]\$'
PS1='\[\e[1;32m\][\W]>\[\e[0m\]'


# ALIASES
alias neofetch='fastfetch'
alias chrome='google-chrome-stable'
alias hlc='nvim ~/.config/hypr/hyprland.conf'
alias bash='nvim ~/.bashrc'
alias bt='bluetoothctl connect <YOUR_MAC_HERE>'
alias clr='clear'
alias rwb='~/.config/waybar/launch.sh'
alias vpn='sudo resolvconf -u && sudo wg-quick up phone'
alias vpno='sudo wg-quick down phone && echo -e "nameserver 1.1.1.1\nnameserver 8.8.8.8" | sudo resolvconf -a enp7s0 && sudo resolvconf -u'
alias wbc='nvim ~/.config/waybar/config'
alias wbcss='nvim ~/.config/waybar/style.css'
alias fixnet='echo -e "nameserver 1.1.1.1\nnameserver 8.8.8.8" | sudo resolvconf -a enp7s0 && sudo resolvconf -u'
alias tg='telegram-desktop'
alias usbmount='sudo mount /dev/sdb1 /mnt/usbdrive'
alias logout='hyprctl dispatch exit'
alias wtf='wtfutil'
alias untar='tar -xvf'
alias upd='sudo pacman -Syu'
alias rhp='~/.config/hypr/relaunch_paper.sh'
alias kawb="killall waybar"
alias мзт="sudo resolvconf -u && sudo wg-quick up phone"
# Created by `pipx` on 2025-11-11 14:07:33
export PATH="$PATH:/home/tar/.local/bin"

# Adde3d for Starship by Tar
eval "$(starship init bash)"

source '/home/tar/.bash_completions/comfy.sh'
