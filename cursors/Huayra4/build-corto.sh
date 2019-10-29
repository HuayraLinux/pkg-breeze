#!/bin/bash
# Open initial output.
# Prefer konsole if its there, otherwise fall back to xterminal.
#tty -s; if [ $? -ne 0 ]; then
#	if command -v konsole &>/dev/null; then
#		konsole -e "$0"; exit;
#		else
#		xterm -e "$0"; exit;
#	fi
#fi

cd "$( dirname "${BASH_SOURCE[0]}" )"
RAWSVG="src/cursors.svg"
INDEX="src/cursor.theme"
ALIASES="src/cursorList"


echo -ne "Checking Requirements...\\r"
if [ ! -f $RAWSVG ] ; then
	echo -e "\\nFAIL: '$RAWSVG' missing in /src"
	exit 1
fi

if [ ! -f $INDEX ] ; then
	echo -e "\\nFAIL: '$INDEX' missing in /src"
	exit 1
fi

if  ! type "inkscape" > /dev/null ; then
	echo -e "\\nFAIL: inkscape must be installed"
	exit 1
fi

if  ! type "xcursorgen" > /dev/null ; then
	echo -e "\\nFAIL: xcursorgen must be installed"
	exit 1
fi
echo -e "Checking Requirements... DONE"



echo -ne "Making Folders... $BASENAME\\r"
DIR4X="build/x4"
DIR3X="build/x3"
DIR2X="build/x2"
DIR1X="build/x1"
OUTPUT="$(grep --only-matching --perl-regex "(?<=Name\=).*$" $INDEX)"
OUTPUT=${OUTPUT// /_}
mkdir -p "$DIR4X"
mkdir -p "$DIR3X"
mkdir -p "$DIR2X"
mkdir -p "$DIR1X"
mkdir -p "$OUTPUT/cursors"
echo 'Making Folders... DONE';



for CUR in src/config/*.cursor; do
	BASENAME=$CUR
	BASENAME=${BASENAME##*/}
	BASENAME=${BASENAME%.*}

	echo -ne "\033[0KGenerating simple cursor pixmaps... $BASENAME\\r"

	if [ "$DIR1X/$BASENAME.png" -ot $RAWSVG ] ; then
		inkscape -i $BASENAME -d 72  -f $RAWSVG -e "$DIR1X/$BASENAME.png" > /dev/null
	fi

	if [ "$DIR2X/$BASENAME.png" -ot $RAWSVG ] ; then
		inkscape -i $BASENAME -d 96 -f $RAWSVG -e "$DIR2X/$BASENAME.png" > /dev/null
	fi

	if [ "$DIR3X/$BASENAME.png" -ot $RAWSVG ] ; then
		inkscape -i $BASENAME -d 192 -f $RAWSVG -e "$DIR3X/$BASENAME.png" > /dev/null
	fi
	if [ "$DIR4X/$BASENAME.png" -ot $RAWSVG ] ; then
		inkscape -i $BASENAME -d 384 -f $RAWSVG -e "$DIR4X/$BASENAME.png" > /dev/null
	fi
done

echo -ne "Generating cursor theme...\\r"
for CUR in src/config/*.cursor; do
	BASENAME=$CUR
	BASENAME=${BASENAME##*/}
	BASENAME=${BASENAME%.*}

	ERR="$( xcursorgen -p build "$CUR" "$OUTPUT/cursors/$BASENAME" 2>&1 )"

	if [[ "$?" -ne "0" ]]; then
		echo "FAIL: $CUR $ERR"
	fi
done
echo -e "Generating cursor theme... DONE"

echo "COMPLETE!"
