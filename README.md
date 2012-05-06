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

Then, we just give Email2Face the email we want a face for:

```ruby
require 'email2face'
Email2Face.face("my.email@facebook.com")
```

### Changing the Facebook Account
It's unlikely the included Facebook account will work for long. So, you may need to make a fake Facebook for it. Do not use your own because it's possible that Facebook may ban it.

#### With Ruby on Rails:

* Create a new file in `config/initializers` called `facebook.rb`

* Open that file in a text editor, and drop in the following:

```ruby
Email2Face.username = "FAKE_FACEBOOK_USERNAME"
Email2Face.password = "FAKE_FACEBOOK_PASSWORD"
```

You'll need to restart your application server for it to have any affect.

#### Without Ruby on Rails:

The code above wasn't specific to Ruby on Rails. Just set ```Email2Face.username``` and ```Email2Face.password``` to what you want.
