# Email2Face

You give it an email. It gives you their face.

## Dependencies & Warnings

It needs a Facebook account to work. I *do not* recommend using your own Facebook, and, to demotivate you from doing that, it stores the Facebook account you give it in plaintext. In other words, if you give it your Facebook account, then it's going to be *very* easy for other people to get access to your Facebook, so make a fake Facebook for using this.

### Before jumping in

You need to have Xvfb and QTWebkit installed in order to use this.

To install it on Mac OS X run (with Homebrew):

```brew install qt4```

To install it on Arch Linux run:

```$ sudo pacman -S xserver-xvfb qtwebkit```

To install it on Ubuntu run:

```$ sudo apt-get install xvfb libqtwebkit4 libqtwebkit4-dev```

**Make a fake Facebook to use this**

## Using it

Start off by adding it to your Gemfile:

```ruby
gem 'email2face', :require => 'email2face'
```

Then, we pass in the email, with the Facebook account in a hash:

```ruby
Email2Face.face("the.email.i.use.to.sign.into.facebook@example.com", { :username => "my.fake.facebook@example.com", :password => "123456" })
```

You only need to pass in the fake Facebook the first time you run it. Afterwards, it'll store the account details.

