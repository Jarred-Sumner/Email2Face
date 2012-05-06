# Email2Face

Email2Face is a simple library for getting the person's face behind an email address. At [Lockitron](https://lockitron.com), we wanted faces next to names. It's a lot easier to remember who someone is when you can see their face. But, that's difficult to implement when all you have is an email address and a name.

After thinking about it for awhile, we came up with a good solution. Facebook has lots of faces, so why not use that? But, Facebook does not have an API for searching for profile pictures by email. So, we made one.

## Dependencies & Warnings

It needs a Facebook account to work. I *do not* recommend using your own Facebook because I'm not sure if this plays well with Facebook's TOS. So, make a fake Facebook for it. I've included a default one, but it'll probably be banned by the time you get to it.

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

1.Create a new file in `config/initializers` called `facebook.rb`

2.Open that file in a text editor, and drop in the following:

```ruby
Email2Face.username = "MY_FAKE_FACEBOOK_USERNAME"
Email2Face.password = "MY_FAKE_FACEBOOK_PASSWORD"
```

You'll need to restart your application server for it to have any affect.

#### Without Ruby on Rails:

The code above wasn't specific to Ruby on Rails. Just set ```Email2Face.username``` and ```Email2Face.password``` to what you want.
