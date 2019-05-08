#!/bin/bash

THEMES="HuayraLiso \
		Huayra4"


for theme in $THEMES
do
	echo "Instalando cursores: $theme"
	cp -r cursors/$theme/$theme /usr/share/icons/
done
