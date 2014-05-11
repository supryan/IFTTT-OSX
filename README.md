IFTTT-OSX
============

What the hell is it? Good question. This isn't exactly new information, but I wanted to create an organized, instructional template illustrating how to build custom notifications for use with OSX Notification Center. To put it simply, I love push notifications. I not only wanted a flow of notifications through iOS with the use of <a href="https://ifttt.com" target="_blank">IFTTT</a> and <a href="https://www.pushover.net" target="_blank">Pushover</a>, but I also wanted to receive these same notifications on OSX as well. I bundled a few apps together using the core framework of <a href="https://github.com/alloy/terminal-notifier" target="_blank">Terminal Notifier</a> to get OSX notifications of some of my most frequently used apps not available through OSX. Therefore, IFTTT-OSX is bridging the gap between push notifications across all devices. I want to make this clear that all this could not be done without the use of IFTTT, Terminal Notifier, <a href="https://www.dropbox.com" target="_blank">Dropbox</a>, and <a href="http://www.noodlesoft.com/hazel.php" target="_blank">Hazel</a>. Shoutouts to the developers of these apps are listed below.

App Releases
============

These are some of the apps I included as releases. Feel free to make your own with  <a href="https://github.com/alloy/terminal-notifier" target="_blank">Terminal Notifier</a> or the Xcode Project I included in this repo if you want to build off the others.

<ol>
<li><strong>Automatic (Driving Assistant) | <a href="http://www.automatic.com" target="_blank">Website</a> | <a href="http://www.automatic.com">Release (v1.0)</a> |</strong></li>
<li><strong>Starbucks | <a href="http://www.starbucks.com" target="_blank">Website</a> | <a href="http://www.automatic.com">Release (v1.0)</a> |</strong></li>
</ol>

Installation
============

Download a release by selecting one above or create your own app with the Xcode project provided. Drag your custom OSX Notification app into: 
<pre><code>/Library/ScriptingAdditions/</code></pre>
<strong>Don't forget to code-sign the app using Terminal (or your Developer ID via Xcode) or they will not run under GateKeeper! (OSX 10.8x)</strong>. To do this, you will have to create your own trusted certificate using Keychain Access. Codesign the app like so, where 'jickpictures' is your certificate signature, and then the path to your app:
<pre><code>codesign -f -s jickpictures /Library/ScriptingAdditions/Application.app</code></pre>
To check your credentials and other executable information, simply do:
<pre><code>codesign -dvvvv /Library/ScriptingAdditions/Application.app</code></pre>
Next, you're going to want to set up some folder actions for use with IFTTT and Dropbox. This is what will run the shell script calling the notifications. I recommend setting this up with Hazel, because I pre-built some rules with the shell scripts included. However, if you can't use Hazel, OSX has a similiar functionality with Automator and it's own folder actions.

Examples
============

<p>Here are a few examples of what you could do with these bundled apps. If for some reason the Hazel rules weren't working for you, I've listed them out here:</p>
------------
<p><strong>1. Parking Location Reminder</strong> | Automatic<br>
<i>Description: If ignition turns off, send an OSX notification of the most recent location you parked. Downloads a map image used as the input for <code>-contentImage</code>, and opens the downloaded image using both <code>-activate</code> and <code>-open "file://$1"</code>.</i></p>
------------
<ul>
<li>IFTTT Recipe <a href="#" target="_blank">(View shared receipe)</a>:</li>
</ul>
| Automatic | Dropbox |
| ------------- | ------------- |
| Ignition Off | Download file from URL |
<ul>
<li>Hazel rules:</li>
</ul>
| Conditions (All) | | |
| :------------- | ------------- | -------------- |
| Name | starts with | "parking_location" |
| Kind | is | image |
| Date Last Matched | is blank | |
| <strong>Actions</strong> | | |
| Name | starts with | "parking_location" |
| Kind | is | image |
<ul>
<li>Shell script:</li>
<pre><code>!#/bin/sh
/Library/ScriptingAdditions/Automatic.app/Contents/MacOS/Automatic -title 'Parking Reminder' -message 'Just in case you were wondering, you recently parked in this location:' -activate 'com.apple.Preview' -open "file://$1" -contentImage "$1" -group 'automatic-park' -remove 'automatic-park'</code></pre>
</ul>
------------

Shoutouts
============

<p><strong><a href="https://github.com/alloy/terminal-notifier" target="_blank">Terminal Notifier</a> by alloy</strong> | CORE FRAMEWORK<br>
<i>The core framework developed by alloy in each of these bundled apps that allows triggering of custom OSX Notifications from the command line. The main purpose for this project.</i><br></p>
<p><strong><a href="http://www.noodlesoft.com/hazel.php" target="_blank">Hazel</a> by Noodlesoft</strong> | NOT REQUIRED (BUT REALLY HELPS)<br>
<i>A must-have OSX Utility that allows you to create folder actions (on steroids) based on a wide variety of rules and a heavy-set imagination. I definitely recommend getting this utility as it will make your life infinitely times easier. But, for the sake of variety and poverty level, the same can be done with Automator and the folder actions features included in OSX.</i></p>

Copyright
============

Basically, I didn't design any of the icons or write any of the code within these bundled apps. I did, however, resize the app icons for Retina Display, wrote a little extra to the shell scripts calling the notifications, and built the Hazel rules driving the actions from IFTTT. Please see the 'Shoutouts' section above. With that said, I can't go to jail. More coming soon.
