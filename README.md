IFTTT-OSX
============

What the hell is it? Good question. This isn't exactly new information, but I wanted to create an organized, instructional template illustrating how to build custom notifications for use with OSX Notification Center. To put it simply, I love push notifications. I not only wanted a flow of notifications through iOS with the use of <a href="https://ifttt.com" target="_blank">IFTTT</a> and <a href="https://www.pushover.net" target="_blank">Pushover</a>, but I also wanted to receive these same notifications on OSX as well. I bundled a few apps together using the core framework of <a href="https://github.com/alloy/terminal-notifier" target="_blank">Terminal Notifier</a> to get OSX notifications of some of my most frequently used apps not available through OSX. Therefore, IFTTT-OSX is bridging the gap between push notifications across all devices. I want to make this clear that all this could not be done without the use of IFTTT, Terminal Notifier, <a href="https://www.dropbox.com" target="_blank">Dropbox</a>, and <a href="http://www.noodlesoft.com/hazel.php" target="_blank">Hazel</a>. Shoutouts to the developers of these apps are listed below.

App Releases
============

Here are some of the bundled apps I pre-built as releases. Feel free to make your own with  <a href="https://github.com/alloy/terminal-notifier" target="_blank">Terminal Notifier</a> or the Xcode Project I included in this repo if you want to add to the others.

<ol>
<li><strong>Automatic (Driving Assistant) | <a href="http://www.automatic.com" target="_blank">Website</a> |  <a href="https://ifttt.com/recipes/193804-if-ignition-turned-off-then-notify-of-the-location-on-osx-notification-center-using-hazel" target="_blank">IFTTT Recipe</a> | <a href="https://github.com/jickpictures/IFTTT-OSX/releases/tag/v1.1">Release (v1.1)</a> |</strong></li>
<li><i>More bundled releases coming very shortly...</i></li>
</ol>

Installation
============

Download a release by selecting one above or create your own app with the Xcode project provided. Drag your custom OSX Notification app into: 
<pre><code>/Library/ScriptingAdditions/</code></pre>
<strong>Don't forget to code-sign the app using Terminal (or your Developer ID via Xcode) or they will not run under GateKeeper! (OSX 10.8x)</strong>. To do this, you will have to create your own trusted certificate using Keychain Access. Codesign the app like so, where 'jickpictures' is your certificate signature, and then the path to your app:
<pre><code>codesign -f -s jickpictures /Library/ScriptingAdditions/Application.app</code></pre>
To check your credentials and other executable information, simply do:
<pre><code>codesign -dvvvv /Library/ScriptingAdditions/Application.app</code></pre>
You'll most likely have to restart your computer for the new app to be registered. Now, you'll probably want to set up some folder actions. This is what will run the shell script calling the notifications when receiving a file from IFTTT in your Dropbox. I recommend setting this up with <a href="http://www.noodlesoft.com/hazel.php" target="_blank">Hazel</a>, because I pre-built some rules with the shell scripts already included in the releases. However, if you can't use Hazel, OSX has a similiar functionality with Automator and it's own folder actions feature.

Example
============

<p>Here is an example of what you could do with these bundled apps. Complete documentation of usage examples/ideas are available on each app bundle release page (i.e. Automatic). If for some reason the Hazel rules aren't working for you, I've layed them out so you can set them up manually:</p>
------------
<p><strong>Parking Location Reminder</strong> | Automatic<br>
<i>Description: If ignition turns off, send an OSX notification of the most recent location you parked. Downloads a map image used as the input for <code>-contentImage</code>, and opens the downloaded image using both <code>-activate</code> and <code>-open "file://$1"</code>. In my case, I have it open up Apple Maps as demonstrated with the example shell script below.</i></p>
<ul>
<li>IFTTT Recipe <a href="#" target="_blank">(View shared receipe)</a>:</li>
</ul>
| | Automatic | | Dropbox |
| :-------------: | :------------- | :-------------: | :------------- |
| <i>IF</i> | Ignition Off | <i>THEN</i> | Add file from URL |
<strong>FILE URL:</strong> [LocationMapImageURL]<br>
<strong>FILE NAME:</strong> [LocationMapURL]<br>
<strong>DROPBOX FOLDER PATH:</strong> Apps/IFTTT/Automatic
<ul>
<li>Hazel rules:</li>
</ul>
| Conditions (All) | | |
| :------------- | ------------- | -------------- |
| Name | starts with | "http" |
| Kind | is | image |
| Date Last Matched | is blank | |
| Date Created | is among | 1 most recent |
| Subfolder depth | is | 2 |
| <strong>Actions</strong> | | |
| Run shell script | embedded script | (Or use 'parking.sh') |
| Copy | to folder | (enclosing folder) |
| Sort into subfolder | with pattern | (date created) |
| Rename | with pattern | "Parked on (date created)(extension)" |
<p><strong>NOTE:</strong> Hazel rules included in the releases can include a 'utility rule' that I clearly outlined for myself. These rules are always labeled with 3 slashed before and after like so: <code>/// Trash Files ///</code>. These are optional, but work to cleanup your Automatic directory and organize the downloaded files from IFTTT. Utility rules can sometimes be necessary for running the rest of the rules under them. Common examples of these rules are always labeled similarly to: <code>/// These Subfolders ///</code>. Some of these might be required to use my pre-built rules. Check the note icon included with the rule for more information on the conditions and actions. <i>I know, it's sickening; I'm that organized.</i></p>

<ul>
<li>Shell script:</li>
<pre><code>!#/bin/sh
# OSX NOTIFICATION
NAME=`basename "$1"` # Gets name of file
LAT=`${NAME#*_}` # Remove everything before the first underscore symbol
LONG=`${LAT%%_z*}` # Remove everything up until the farthest '_z' from the right
GEO=`${LONG/_/,}` # Remove underscore symbol between geocodes
ZOOM=`19`

/Library/ScriptingAdditions/Automatic.app/Contents/MacOS/Automatic -title 'Parking Reminder' -message "Just in case you were wondering, you recently parked in this location:" -contentImage "$1" -activate 'com.apple.Maps' -open "http://maps.apple.com/?q=$GEO&z=$ZOOM" -group 'automatic-park'</code></pre>
</ul>
------------

Shoutouts
============

<p><strong><a href="https://github.com/alloy/terminal-notifier" target="_blank">Terminal Notifier</a> by alloy</strong> | CORE FRAMEWORK<br>
<i>The core framework developed by alloy in each of these bundled apps that allows triggering of custom OSX Notifications from the command line. The main purpose for this project.</i><br></p>
<p><strong><a href="http://www.noodlesoft.com/hazel.php" target="_blank">Hazel</a> by Noodlesoft</strong> | NOT REQUIRED (BUT REALLY HELPS)<br>
<i>A must-have OSX Utility that allows you to create folder actions (on steroids) based on a wide variety of rules and a heavy-set imagination. I definitely recommend getting this utility as it will make your life infinitely times easier. But, for the sake of variety and poverty level, the same can be done with Automator and the folder actions features included in OSX.</i></p>
<p><strong><a href="http://www.dropbox.com" target="_blank">Dropbox</a></strong> | REQUIRED <br>
<i>Need I say more about this one? </i></p>
<p><strong><a href="http://www.ifttt.com" target="_blank">IFTTT</a></strong> | REQUIRED <br>
<i>Required for triggering created files on your Dropbox that Hazel interacts with. All of these examples require a computer to be running all the time.</i></p>

License
============

Basically, I didn't design any of the icons or write any of the code within these bundled apps. I did, however, resize the app icons for Retina Display, wrote a little extra to the shell scripts calling the notifications, and built the Hazel rules driving the actions from IFTTT. Please see the 'Shoutouts' section above. With that said, I can't go to jail. More coming soon.
