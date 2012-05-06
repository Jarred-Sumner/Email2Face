# Email2Face

You give it an email. It gives you their face.

## Dependencies & Warnings

It needs a Facebook account to work. I *do not* recommend using your own Facebook because it stores the Facebook account in plaintext. So, make a fake Facebook for it. I've included a default one, but it'll probably be banned by the time you get to it.

### Before jumping in

You need to have Xvfb and QTWebkit installed in order to use this.

#### Install it on Mac OS X:

```bash
$ brew install qt
```
Then, download and install [XQuartz](http://xquartz.macosforge.org/downloads/SL/XQuartz-2.7.1.dmg).

#### Install it on Arch Linux:

```bash
$ sudo pacman -S xorg-server-xvfb qtwebkit
```

#### Install it on Ubuntu:

```bash
$ sudo apt-get install xvfb libqtwebkit4 libqtwebkit4-dev
```

## Using it

Start off by installing the gem:

```ruby
gem install 'email2face'
```

Then, we pass in the email, with the Facebook account in a hash:

```ruby
require 'email2face'
Email2Face.face("my.email@facebook.com")
```
I've included a fake Facebook by default. However, it could be disabled at any time.

When you want to change the Facebook account, just run

```ruby
require 'email2face'
Email2Face.face("my.email@facebook.com", { :username => "fb_account@example.com", :password => "fbpassword" })
```