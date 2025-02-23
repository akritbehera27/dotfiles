#!/bin/sh

#INSTALLING PACKAGES   

video_drivers="xf86-video-intel xf86-input-evdev"
common_packages="less openssh git trash-cli"
xorg="xorg-server xorg-apps xorg-xinit"
window_manager="bspwm picom polybar rofi dunst alacritty lf lxappearance qt5ct feh sxhkd dunst"
themes="papirus-icon-theme adwaita-cursors"
fonts="terminus-font gnu-free-fonts ttf-firacode-nerd otf-font-awesome "

echo "Provide the Root Password"
su - root -c "pacman -S $video_drivers $common_packages $xorg $window_manager $themes $fonts"
clear


#SETTING UP CONSOLE FONT
searchl=$( cat /etc/vconsole.conf | grep FONT | wc -l )
if [ $searchl -gt 0 ];then
	echo "Console Font is already seted........."	
else
	echo "Provide the Root Password"
	su - root -c 'echo "FONT=ter-v22n" >> /etc/vconsole.conf'
	echo "Console Font is setted"
fi

#CLONING GIT DIRECTORY

if [ -d ./dotfiles ]; then
	echo "Directory Already Exisits........"
else
	git clone https://github.com/akritbehera27/dotfiles
fi
clear

# COPYING CONFIG FILES TO HOME 
cd dotfiles
sed -i s/user/$USER/g .config/alacritty/alacritty.toml
echo "Coppying files into ~ "

cp -r .config ~
cp -r .local ~
cp .bash-configs/.bashrc ~

