IFTTT-OSX
============

What the hell is it? Good question. This isn't exactly new information, but I wanted to create an organized, instructional template illustrating how to build custom notifications for use with OSX Notification Center. To put it simply, I love push notifications. I not only wanted a flow of notifications through iOS with the use of <a href="https://ifttt.com">IFTTT</a> and <a href="https://pushover.net">Pushover</a>, but I also wanted to receive these same notifications on OSX as well. I bundled a few apps together using <a href="https://github.com/alloy/terminal-notifier">Terminal Notifier</a> to get OSX notifications of some of my most frequently used apps that did not provide OSX apps to begin with. Therefore, bridging the gap between push notifications on all devices. All this could not be done without the use of IFTTT, Terminal Notifier, Dropbox, and <a href="http://www.noodlesoft.com/hazel.php">Hazel</a>. Shoutouts to the developers of these apps are listed below.

Shoutouts
============

I wrote this various scripts for use with <a href="https://github.com/alloy/terminal-notifier">Terminal Notifier by alloy</a>, so, thanks for that! I also combined some automated tasks with IFTTT and Dropbox using  <a href="https://github.com/alloy/terminal-notifier">Hazel by Noodlesoft</a>.

App Releases
============

These are some of the apps I included as releases. Feel free to make your own with  <a href="https://github.com/alloy/terminal-notifier">Terminal Notifier</a> or the Xcode Project I included in this repo if you want to build off the others.

<ol>
<li><a href="http://www.automatic.com">Automatic (Driving Assistant)</a></li>
<li><a href="http://www.starbucks.com">Starbucks</a></li>
</ol>

Installation
============

Download. Don't forget to code-sign or they will not run under GateKeeper.

Examples
============

Here are a few examples of what you could do with these bundled apps.

<h4><i>Automatic (Driving Assistant)</i></h4>
<i>Parking Location Reminder</i>
Included in Release: <a href="#">Yes</a><br>
<ul>
<li>IFTTT Receipe:</li>
<li>Hazel rules:</li>
<li>Shell script:</li>
<pre><code>/Library/ScriptingAdditions/Automatic.app/Contents/MacOS/Automatic -title 'Parking Reminder' -message 'Just in case you were wondering, you recently parked in this location:' -activate 'com.apple.Preview' -open file://"$1" -contentImage "$1" -group 'automatic-park' -remove 'automatic-park'</code></pre>
</ul>

Copyright
============
