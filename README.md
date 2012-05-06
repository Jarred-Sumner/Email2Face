# Email2Face

You give it an email. It gives you their face.

## Dependencies & Warnings

It needs a Facebook account to work. I *do not* recommend using your own Facebook, and, to demotivate you from doing that, it stores the Facebook account you give it in plaintext. In other words, if you give it your Facebook account, then it's going to be *very* easy for other people to get access to your Facebook, so make a fake Facebook for using this.

### Before jumping in

You need to have Xvfb and QTWebkit installed in order to use this.

To install it on Mac OS X run (with Homebrew):

```bash
$ brew install qt4 && wget "http://xquartz.macosforge.org/downloads/SL/XQuartz-2.7.1.dmg" && open "XQuartz-2.7.1.dmg"
```

To install it on Arch Linux run:

```bash
$ sudo pacman -S xorg-server-xvfb qtwebkit
```

To install it on Ubuntu run:

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

Email2Face.face("the.email.i.use.to.sign.into.facebook@example.com", { :username => "my.fake.facebook@example.com", :password => "123456" })
```

You only need to pass in the fake Facebook the first time you run it. Afterwards, it'll store the account details.

