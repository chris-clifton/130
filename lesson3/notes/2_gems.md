# Gems

## What are Gems?
- Gems are packages of code you can download, install, and use in Ruby programs or from command line.  `gem` command manages your Gems.
- Example gems: `rubocop`, `pry`, `sequal` (provides set of classes/methods to simplify database access), `rails` (web application framework that speeds web app development)
- Basics of Gems are pretty simple.  Search RubyGems website to find a gem you want to install then run `gem install` to install Gem on system.

# Gems, Ruby, and your Computer

## The Remote Library
- To find GEms you will need to search through remote Gem library- most often used is RubyGems Library
- You may also search a specialized remote library run by employer or school
- When you run `gem install GEM_NAME` command, the `gem` command connects to the remote library, downloads the appropriate Gems, and installs them.  If you specify additional remote libraries, `gem` connects to those libraries to find the Gems you want

## The Local Library
- When you download a Gem, `gem` installs it in local file system in a location where Ruby and your system can find the files and commands it needs- this location is the **local library**

## Gems and Your File System
- Sometimes you need to determine where `gem` puts things on your system- you may need to look at source code to better understand how a Gem works, for example, or diagnose why a Gem is not working as expected.
- While you can look at source code of a gem on local system, do not make changes to it. Changes may impact expected behavior and you will lose them next time you update the gem
- To find out where `gem` installs Gems, use command `gem env` 
  - this prints a long list of info about RubyGems installation

## Breaking down `gem env`
- **Ruby Version**: version number of Ruby associated with `gem` command
  - if you have multiple versions of Ruby installed, then you have multiple versions of `gem` installed
  - Helpful diagnostic, if you see an unexpected version you are likely using the wrong version of `gem` or `ruby`
- **Ruby Executable**: this is the location of the `ruby` command you should use with Gems
  - Helpful info when RUBY VERSION reveals a `gem`/`ruby` mismatch.
- **Installation Directory**: Where `gem` installs Gems by default.
  - Under `rbenv` you may see two versions in name: first version is major version, second version is actual.  Ignore major version.
- **User Installation Directory**: Depending on installation of Ruby and options you pass to `gem`, `gem` may install Gems somewhere in your home directory isntead of system-level directory  This is the location in your home directory that `gem` uses in such cases.
  - Structure is the same as Installation Directory
- **Executable Installation Directory**: Some Gems provide commands that you can use directly from a terminal prompt: `gem` places those commmands in this directory
  - You need to include this directory in your shell `PATH` variable so that the shell can find these commands.  Ruby version manager (rbenv of RVM) usually handles this, but its useful to know where to look if you have problems.
- **Shell Path**: A list of directories in your shell `PATH` variable.  If you are having problems with a `command not found` message or running wrong versions of programs, this listing may provide valuable clues about where the system looks for your programs

## Which File Was Required?
- To determine Gem version, you ned to know the full path name of the file that your program loaded.  Easiest way to do this is to insert some debugging code (or a call to `binding.pry`) in program
```ruby
puts $LOADED_FEATURES.grep(/freewill\.rb/)
```
- This will print something like:
```ruby
/usr/local/rvm/gems/ruby-2.2.4/gems/freewill-1.0.0/lib/freewill.rb
```
- That command searches for any entries in the `$LOADED_FEATURES` Array that include `freewill.rb` in the name and prints all mathing entires.  With luck, there is just one entry, though sometimes you may have several from which to choose- usually easy to choose right entry though.

## Multiple Gem Versions
- Sometimes we want to use an older version of a Gem.  Sometimes we need a particular version to work with other parts of our program.  This can be addressed in several ways:
  - Provide absolute path name to `require`
  - Add an appropriate -I option to ruby invocation
  - Modify `$LOAD_PATH` prior to requiring some gem
  - Modify `RUBYLIB` environment variable
- These fixes are all hacks and will quickly become unmanageable and an enormous mess and source of bugs.  You definitely do not want to go down this road except in the extremely short-term.  
- The right choice is to use Bundler.