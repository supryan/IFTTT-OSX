# OSX NOTIFICATION
# IFTTT: Automatic - If ignition turned off, then notify me on OSX of where I parked along with a location on a map. | 
NAME=`basename "$1"` # Gets name of file
LAT=${NAME#*_} # Remove everything before the first underscore symbol
LONG=${LAT%%_z*} # Remove everything up until the farthest '_z' from the right
GEO=${LONG/_/,} # Remove underscore symbol between geocodes
ZOOM=`19`

/Library/ScriptingAdditions/Automatic.app/Contents/MacOS/Automatic -title 'Parking Reminder' -message "Just in case you were wondering, you recently parked in this location:" -contentImage "$1" -activate 'com.apple.Maps' -open "http://maps.apple.com/?q=$GEO&z=$ZOOM" -group 'automatic-park'