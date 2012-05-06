# Email2Face

You give it an email. It gives you their face.

## Dependencies & Warnings

It needs a Facebook account to work. I *do not* recommend using your own Facebook, and, to demotivate you from doing that, it stores the Facebook account you give it in plaintext. In other words, if you give it your Facebook account, then it's going to be *very* easy for other people to get access to your Facebook, so make a fake Facebook for using this.

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

**You need to make a fake Facebook account to use this!**

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