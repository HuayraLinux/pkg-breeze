#!/bin/bash

THEMES="HuayraLiso \
		Huayra4 \
		Huayra6"


for theme in $THEMES
do
	echo "Haciendo cursores: $theme"
	cursors/$theme/build.sh
done
