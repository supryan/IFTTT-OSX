IFTTT-OSX
============

What the hell is it? Good question. This isn't exactly new information, but I wanted to create an organized, instructional template illustrating how to build custom notifications for use with OSX Notification Center. To put it simply, I love push notifications. I not only wanted a flow of notifications through iOS with the use of <a href="https://ifttt.com" target="_blank">IFTTT</a> and <a href="https://www.pushover.net" target="_blank">Pushover</a>, but I also wanted to receive these same notifications on OSX as well. I bundled a few apps together using <a href="https://github.com/alloy/terminal-notifier" target="_blank">Terminal Notifier</a> to get OSX notifications of some of my most frequently used apps that did not provide OSX apps to begin with. Therefore, bridging the gap between push notifications on all devices. All this could not be done without the use of IFTTT, Terminal Notifier, Dropbox, and <a href="http://www.noodlesoft.com/hazel.php" target="_blank">Hazel</a>. Shoutouts to the developers of these apps are listed below.

Shoutouts
============

I wrote this various scripts for use with <a href="https://github.com/alloy/terminal-notifier" target="_blank">Terminal Notifier by alloy</a>, so, thanks for that! I also combined some automated tasks with IFTTT and Dropbox using  <a href="https://github.com/alloy/terminal-notifier" target="_blank">Hazel by Noodlesoft</a>.

App Releases
============

These are some of the apps I included as releases. Feel free to make your own with  <a href="https://github.com/alloy/terminal-notifier" target="_blank">Terminal Notifier</a> or the Xcode Project I included in this repo if you want to build off the others.

<ol>
<li>Automatic (Driving Assistant) | <a href="http://www.automatic.com" target="_blank">Website</a> | <a href="http://www.automatic.com">Release (v1.0)</a> |</li>
<li>Starbucks | <a href="http://www.starbucks.com" target="_blank">Website</a> | <a href="http://www.automatic.com">Release (v1.0)</a> |</li>
</ol>

Installation
============

Download a release by selecting one above or create your own app with the Xcode project provided. Drag your custom OSX Notification app into: <pre><code>/Library/ScriptingAdditions/</code></pre><strong>Don't forget to code-sign the app using Terminal (or your Developer ID via Xcode) or they will not run under GateKeeper! (OSX 10.8x)</strong>

Examples
============

Here are a few examples of what you could do with these bundled apps.

<strong>Automatic (Driving Assistant)</strong><br>
<i>Parking Location Reminder</i><br>
Released: <a href="#">Yes</a><br>
<ul>
<li>IFTTT Receipe:</li>
<li>Hazel rules:</li>
<li>Shell script:</li>
<pre><code>/Library/ScriptingAdditions/Automatic.app/Contents/MacOS/Automatic -title 'Parking Reminder' -message 'Just in case you were wondering, you recently parked in this location:' -activate 'com.apple.Preview' -open file://"$1" -contentImage "$1" -group 'automatic-park' -remove 'automatic-park'</code></pre>
</ul>
------------


Copyright
============

Basically, I didn't design any of the icons or write any of the code within these bundled apps besides the shell scripts and Hazel rules. Please see the 'Shoutouts' section above. With that said, I can't go to jail. More coming soon.
