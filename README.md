IFTTT-OSX
============

What the hell is it? Good question. To put it simply, I love push notifications. I not only wanted a flow of notifications through iOS with the use of <a href="https://ifttt.com">IFTTT</a> and <a href="https://pushover.net">Pushover</a>, but I also wanted to receive these same notifications on OSX as well. I bundled a few apps together using <a href="https://github.com/alloy/terminal-notifier">Terminal Notifier</a> to get OSX notifications on some of my most frequently used apps that did not provide OSX apps to begin with, therefore bridging the gap between push notifications on all devices. All this could not be done without the use of IFTTT, Terminal Notifier, Dropbox, and <a href="http://www.noodlesoft.com/hazel.php">Hazel</a>. Shoutouts to these developers are listed below.

Shoutouts
============

I wrote this various scripts for use with <a href="https://github.com/alloy/terminal-notifier">Terminal Notifier by alloy</a>, so thanks for that. I also combined some automated tasks with IFTTT and Dropbox using  <a href="https://github.com/alloy/terminal-notifier">Hazel by Noodlesoft</a>.

Installation
============

More coming soon. Don't forget to code-sign or they will not run under GateKeeper.

Examples
============

Here are a few examples of what you could do with these bundled apps.

<strong>Automatic (Driving Assistant)</strong><br>
Parking Location Reminder<br>
<i>Included in Release: Yes</i><br>
<ul>
<li>IFTTT Receipe:</li>
<li>Hazel rules:</li>
<li>Shell script:</li>
<pre><code>
/Library/ScriptingAdditions/Automatic.app/Contents/MacOS/Automatic -title 'Parking Reminder' -message 'Just in case you were wondering, you recently parked in this location:' -activate 'com.apple.Preview' -open file://"$1" -contentImage "$1" -group 'automatic-park' -remove 'automatic-park'
</code></pre>
</ul>

Copyright
============
