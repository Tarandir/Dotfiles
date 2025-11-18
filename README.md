<img width="1920" height="1080" alt="2025-10-23-173958_hyprshot" src="https://github.com/user-attachments/assets/f89aa107-89c3-4127-bbce-041857ee226d" />


# Waybar
+ **Menu  **
can be left as is
+ **Youtube handle availability checker**  
replace the placeholder with your desired handle to be notified when it becomes available
+ **MC:JE username availability checker**  
replace the placeholder with your desired username to be notified when it becomes available
+ **Weather and time**  
replace the placeholders with the Open Weather API and the city number
+ **Workspaces**  
adjust the number of and the icons for the workspaces, also check Hyprland conf to change auto-launched apps on boot
+ **WireGuard status**  
replace the name of the WG interface to your conf name in /etc/wireguard/
+ **Bluetooth and Volume control**  
replace the Mac address and trhe alt Alias if you want a custom alias for that specific device. Scroll on the module to change volume
+ **Keyboard layout indicator**  
Toggle is set to Shift+Alt
+ **Power Off button**  
click to shutdown

# HL Config
Change MAC for the BT speaker in **Auto-Start**  
Change Keyboard lauyouts and toggle keys in the hyprland conf in **Input**  
Change hyprpaper and printscreen keybindings in **Keybindings**  
Transparent Thunar is controlled via `windowrulev2 = opacity 0.6 0.6,class:^(thunar)$` in **Evironment variables**
