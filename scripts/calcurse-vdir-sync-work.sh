#!/bin/sh

# Remove calcurse appointments
CALCURSE_APTS="$HOME/.local/share/calcurse/apts"
rm "$CALCURSE_APTS"

# Import ics files
VDIR="$HOME/.calendars/work/calendar"
cd "$VDIR" || exit
for file in *.ics; do
	calcurse --import "$file"
done

