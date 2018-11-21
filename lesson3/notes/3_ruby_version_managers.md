# Ruby Version Managers

## What are Ruby Version Managers
- Ruby Version Managers are programs that let you install, manage, and use multiple versions of Ruby.
- Two major Ruby Version Managers: RVM and rbenv
  - they take different approaches but result is same: you can easily use multiple versions of Ruby on same system

# RVM
- At RVM's core, is a set of directories in which RVM stores all ruby versions, associated tools (`gem`, `irb`, etc.) and its Gems.  Each directory is specific toa given Ruby version.
- If you need Ruby 2.3.1, RVM uses the files in the `ruby-2.3.1` directory, and if you need 2.4.1 it uses `ruby-2.4.1` etc.
- `rvm use 2.2.4` modifies `PATH` variable so that the `ruby` command uses ruby installed in `ruby-2.2.4` directory.

# rbenv
- rbenv and RVM feel similar with only a small difference in syntax but, under the hood, rbenv manages Rubies in a significant departure from RVM.  rbenv uses a set of small scripts called **shims**
  - the scripts have the same names as various ruby and Gem programs
  - they live in the `shims` sub-directory

## Setting Local Rubies
```console
$ rbenv global 2.3.1
```
- This sets default version of ruby to 2.3.1
- Lets say program in `~/src/magic` directory needs 2.0.0. To arrange that:
```console
$ cd ~/src/magic
$ rbenv local 2.0.0
```
- This creates a `.ruby-version` file in `~/src/magic` directory and when you run any Ruby-based programs stored in this directory, `rbenv` checks the `ruby-version` file and uses that version of ruby for the program.

## Where are my Rubies, Gems, and Apps now?
- rbenv creates a directory at installation known as rbenv root directory.  Easily find this folder with:
```console
$ rbenv root
```
- There are two important subdirectories in the root directory: `shims` and `versions`. 
  - `shims` contains all shims used by rbenv
  - `versions` contains all the different rubies
- Useful rbenv troubleshooting commands
- `rbenv version`
  - Shows currently active version of Ruby
- `echo $PATH`
  - Confirms your `shims` directory is in your PATH and that it is early in your PATH.
- `rbenv which COMMAND` swap COMMAND for `ruby`, `irb`, `rubocop`, etc.
- `rbenv shims` display a list of all current shims
- `gem env` display configuration info of RubyGems system

## Plugins
- There are dozens of plugins that extend the capabilities provided by rbenv- don't forget to check them out as your use of rbenv expands
- `ruby-build` is such a useful one because it adds the `install` command to the `rbenv` command so you can instal rubies directly with rbenv- this is easier than manually configuring and installing each version

# Summary
- Ruby version managers let you manage multiple versions of Ruby, the utilities associated with each version, and the RubyGems installed for each Ruby
- With version managers, you can install and uninstall ruby versions and gems, and run specific versionf of ruby with specific programs and environments
- By default, RVM has more features but rbenv plugins provide much more functionality not provided by base install
- RVM works by dynamically changing your environment, mostly `PATH` variable and replacing built-in `cd` command with an RVM-aware shell function
- rbenv works by just modifying your `PATH` and osme other environmet variables