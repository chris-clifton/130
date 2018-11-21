# Bundler
Dealing with dependencies (multiple versions of Ruby and multiple versions of Gems) is a significant issue in Ruby.  RVM and rbenv are helpful Ruby version managers that can also be used to manage Gem dependencies, but the favored approach is to use a dependency manager- like Bundler.

## Installing Bundler
```console
gem install bundler
```

## Gemfile and Gemfile.lock
- Bundler relies on a file named `Gemfile` to tell it which version of Ruby and its Gems it should use.
- This file is a simple Ruby program that uses a DSL(Domain Specific Language) to provide details about Ruby and Gem versions- it's the config or instruction file for Bundler.
- After you create `Gemfile`, the `bundle install` command scans it, downloads, and installs all the dependencies listed, and produces a `Gemfile.lock` file.
- `Gemfile.lock` shows all dependencies for your program; this includes the Gems listed in `Gemfile`, as well as the Gems they depend on (which may not be explicitly listed in `Gemfile`)

## Running Apps with Bundler
- once bundler creates your `Gemfile.lock` add:
```ruby
require 'bundler/setup`
```
  - this must be at beginning of app, before any other Gems (unneeded if creating a Rails app)
- `bundler/setup` first removes all Gem directories from Ruby's `$LOAD_PATH` global array.
  - Ruby uses`$LOAD_PATH` to list directories it searches when it needs to locate a required file.  
  - When `bundler/setup` removes those directories from `$LOAD_PATH`, Ruby can no longer find those gems.
  - To fix this, `bundler/setup` reads `Gemfile.lock` and, for each Gem listed, it adds the directory that contains that Gem back to `$LOAD_PATH`.
  - When finished, `require` only finds the proper versions of each Gem.  This ensures the specific Gem and version your app depends on is loaded, and not a conflicting version of that Gem
- you may see advice to add `require 'rubygems'` but this is unnecessary- statement is a holdover from days before RubyGems became an official part of Ruby and this functionality is now provided automatically

## Where are my Rubies, Gems and Apps now?
- Bundler does not interfere with Rubies nor their gems.  They remain where they were before you installed Bundler and will continue to use same setu pin future
- However, bundler provides a feature called `binstubs`, if you use this feature you may have to add some directories to your `PATH`.

## `bundle exec`
- Sometimes you will encounter situations where you can't just add `require 'bundler/setup'` to code, or program itself may run code that has conflicting needs.  When this happens, you need the mysterious `bundle exec` command
- You can use `bundle exec` to run most any command in an environment that conforms to the `Gemfile.lock` versioning info.
- `bundle exec COMMAND` resolves issues with versioning by using the version of command/gem outlined in Gemfile

## When things go wrong
- try removing `Gemfile.lock` and run `bundle install` again.  This creates a new `Gemfile.lock`
- remove `.bundle` directory and its contents from your project directory and run `bundle install` again
- if you're using `binstubs` feature, remove directory used by `binstubs` and run `bundle install --binstubs` again.  Don't do this if you aren't using binstubs.
- remove and reinstall bundler
```console
$ gem uninstall bundler
$ gem install bundler
```
- if `gem list` shows that either `rubygems-bundler` or `open_gem` are installed, uninstall them.  These old Gems are incompatble with Bundler.  Repeat above items if you remove either gem.
- issue this commmand in CLI from app's top level directory
```console
$ rm Gemfile.lock ; DEBUG_RESOLVER=1 bundle install
```
  - this command removes `Gemfile.lock` then runs `bundle install` while producing debug information.  You can use debug info to see how Bundler resolves each Gem- can be valuable when you arent sure if your app is loading correct Gems

# Summary
- Bundler lets you describe exactly which Ruby and Gems you want to use with your ruby apps
  - specifically, allows you to install multiple versions of each Gem under a specific version of Ruby and then use proper version in your app
- Bundler is a RubyGem so you must install it like a normal gem
- to use bundler, you provide a file named `Gemfile` that descrbes the Ruby and Gem versions you want for your app.  You use a DSL to provide this infol.
- Bundler uses `Gemfile` to generate `Gemfile.lock` via `bundle install` command.  `Gemfile.lock` describes actual versions of each Gem that your app needs, including any Gems that Gems listed in `Gemfile` depend on.  `bundler/setup` package tells Ruby to use `Gemfile.lock` to determine which Gem versions it should load.
- `bundle exec` command ensure exectuable programs installed by Gems don't interfere with apps requirements
  - for instance, if your app needs a particular version of `rake`, but the default version differes, `bundle exec` ensures that you can still run specific `rake` version compatible with app