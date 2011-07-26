# Firelinks

Firelinks automatically mirrors your Firefox browsing session in elinks.

<a href="https://github.com/danchoi/firelinks/raw/master/screens/firelinks1.png" rel="lightbox[screens]"><img src="https://github.com/danchoi/firelinks/raw/master/screens/firelinks1c.png" /></a>

Benefits:

* Use Firefox's graphical interface to navigate the web visually 
* Use elinks' austere textual interface to read content with more concentration and less distraction
* Save plain text versions of webpages with elinks' "Save formatted document" command


## Prerequisites

* Supported platforms: Linux and OS X
* [elinks][elinks]
* Firefox 3 or higher 
* sqlite3 version 3.7.4 or higher
* Ruby (tested on 1.9.2)

[elinks]:http://elinks.or.cz/

## Install

    gem install firelinks

Try running it by typing `firelinks` on the command line. If you get an error
message saying that `firelinks` is missing, then you probably have a `PATH`
issue. Try one of these workarounds:

* Try installing with `sudo gem install firelinks`
* Put the directory where Rubygems installs executables on your `PATH`

To upgrade `firelinks` to a newer version, just repeat the installation procedure.

## How to use it 

Start Firefox. Then start Firelinks by opening a terminal and typing

    firelinks

Firelinks starts Ruby process in your Terminal window, which in turn starts and
manages an `elinks` session that displays the current webpage. 

As you visit pages in Firefox, you should see them load
automatically in the elinks session.

To quit Firelinks, just press `CTRL-C` (instead of the normal quit key sequence for elinks).

## Troubleshooting

If Firelinks starts an elinks session but doesn't seem to be updating it as
you hit new pages in Firefox, you may be missing sqlite3 or in need of a newer version.

Run `sqlite3 -version` to make sure you have a recent version of sqlite3 (3.7.4 or later).


## Bug reports and feature requests

Please submit here:

* <https://github.com/danchoi/firelinks/issues>


## About the developer

My name is Daniel Choi. I specialize in Ruby, Rails, MySQL, PostgreSQL, and iOS
development. I am based in Cambridge, Massachusetts, USA, and the little
software company I run with Hoony Youn is called [Kaja Software](http://kajasoftware.com). 

* Company Email: info@kajasoftware.com
* Twitter: [@danchoi][twitter] 
* Personal Email: dhchoi@gmail.com  
* My Homepage: <http://danielchoi.com/software>

[twitter]:http://twitter.com/#!/danchoi


