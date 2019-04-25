#!/bin/bash

THEMES="huayra-liso \
		huayra-4"


for theme in $THEMES
do
	echo "Haciendo cursores: $theme"
	cursors/$theme/build.sh
done
