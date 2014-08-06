# OSX NOTIFICATION
# IFTTT: Automatic - If ignition turned off, then notify me on OSX of my recent trip. | 
TEXT=`head -2 "$1"` # Read first two lines from the top
URL=`tail -1 "$1"` # Read last line for URL and opening the link

/Library/ScriptingAdditions/Automatic.app/Contents/MacOS/Automatic -title 'Trip Completed' -message "$TEXT" -activate 'com.apple.Safari' -open "$URL" -group 'automatic-trips'