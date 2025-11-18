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
alias bt='bluetoothctl connect <MAC_HERE_NO_BRACKETS>'
alias clr='clear'
alias rwb='~/.config/waybar/launch.sh'
alias vpn='sudo resolvconf -u && sudo wg-quick up <YOUR_WG_INTERFACE_HERE>'
alias vpno='sudo wg-quick down <YOUR_WG_INTERFACE_HERE> && echo -e "nameserver 1.1.1.1\nnameserver 8.8.8.8" | sudo resolvconf -a enp7s0 && sudo resolvconf -u'
alias wbc='nvim ~/.config/waybar/config'
alias wbcss='nvim ~/.config/waybar/style.css'
alias fixnet='echo -e "nameserver 1.1.1.1\nnameserver 8.8.8.8" | sudo resolvconf -a enp7s0 && sudo resolvconf -u'
alias tg='telegram-desktop'
alias usbmount='sudo mount /dev/sdb1 /mnt/usbdrive'
alias logout='hyprctl dispatch exit'
alias wtf='wtfutil'
# Created by `pipx` on 2025-11-11 14:07:33
export PATH="$PATH:/home/tar/.local/bin"

# Added for Starship by Tar
eval "$(starship init bash)"
