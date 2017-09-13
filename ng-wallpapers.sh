#!/bin/bash
today=$(date +"%Y-%m-%d")
if [ ! -e ~/Pictures/wallpaper-ng_${today}.jpg ]; then
	wget --quiet -O - http://www.nationalgeographic.com/photography/photo-of-the-day/ | grep -m 1 http://yourshot.nationalgeographic.com/u/.*/ -o > /home/thomas/Pictures/url
	pic_url=$(cat /home/thomas/Pictures/url)
	wget --quiet ${pic_url%??} -O /home/thomas/Pictures/wallpaper-ng_${today}.jpg
	rm /home/thomas/Pictures/url
	gsettings set org.gnome.desktop.background picture-uri file:///home/thomas/Pictures/wallpaper-ng_${today}.jpg
fi