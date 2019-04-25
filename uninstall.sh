#!/bin/bash

THEMES="Huayra_Liso"


for theme in $THEMES
do
	echo "Eliminando cursores: $theme"
	rm -rf /usr/share/icons/$theme
done
