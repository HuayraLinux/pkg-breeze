#!/bin/bash

THEMES="HuayraLiso \
		Huayra4"


for theme in $THEMES
do
	echo "Eliminando cursores: $theme"
	rm -rf /usr/share/icons/$theme
done
