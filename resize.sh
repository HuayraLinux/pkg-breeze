#!/bin/bash

THEMES="Huayra_Liso \
		Huayra_4"


for theme in $THEMES
do
	echo "Reescribiento tamaño de cursores: $theme"
	python resize_icons.py cursors/$theme/src/config/
done
