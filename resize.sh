#!/bin/bash

THEMES="Bread \
	Breeze \
	Breeze_Amber \
	Breeze_Blue \
	Breeze_Contrast \
	Breeze_Golgari \
	Breeze_Hacked \
	Breeze_Obsidian \
	Breeze_Purple \
	Breeze_Red \
	Breeze_Snow"


for theme in $THEMES
do
	echo "Reescribiento tamaño de cursores: $theme"
	python resize_icons.py cursors/$theme/src/config/
done
