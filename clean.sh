#!/bin/bash

THEMES="Bread \
	Breeze \
	Breeze_Amber \
	Breeze_Blue \
	Breeze_Contrast \
	Breeze_Golgari \
	Breeze_Hacked \
	Breeze_Huayra \
	Breeze_Obsidian \
	Breeze_Purple \
	Breeze_Red \
	Breeze_Snow"


for theme in $THEMES
do
	echo "Limpiando cursores: $theme"
	rm -rf cursors/$theme/$theme
	rm -rf cursors/$theme/build
done
