#!/bin/bash

THEMES="HuayraLiso \
		Huayra4"


for theme in $THEMES
do
	echo "Haciendo cursores: $theme"
	cursors/$theme/build.sh
done
