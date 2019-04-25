#!/bin/bash

THEMES="huayra-liso \
		huayra-4"


for theme in $THEMES
do
	echo "Limpiando cursores: $theme"
	rm -rf cursors/$theme/$theme
	rm -rf cursors/$theme/build
done
