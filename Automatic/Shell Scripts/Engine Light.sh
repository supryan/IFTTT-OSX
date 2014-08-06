# OSX NOTIFICATION
# IFTTT: Automatic - If check engine light goes on, notify me on OSX with the problem. | 
TEXT=`head -3 "$1"` # Read first 3 lines from the top
URL=`tail -1 "$1"`

/Library/ScriptingAdditions/Automatic.app/Contents/MacOS/Automatic -title 'Car Maintanance Required' -message "$TEXT" -activate 'com.apple.Safari' -open "$URL" -group 'automatic-maint'