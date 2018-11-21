# Rake
## What is Rake?
Rake is a RubyGem that automates many common functions required to build, test, package, and install programs- it is a part of every modern Ruby installation

Common Rake tasts:
- setup required environment by creating directories and files
- setup and initialize databases
- run tests
-  package application and all its files for distribution
- install application
- perform common Git tasks
- rebuild certain files and directories (assets) based on changes to other files and directories

In short, you can write Rake tasks to automate anything you want to do with app during development, testing, and release cycles

## How To Use Rake
- Rake uses a file named `Rakefile` that lives in project directory; this file describes the tasks that Rake can perform for your project, and how to perform those tasks
```ruby
desc 'Say hello'
task :hello do
  puts "Hello there. This is the `hello` task."
end

desc 'Say goodbye'
task :bye do
  puts 'Bye now!'
end

desc 'Do everything'
task :default => [:hello, :bye]
```
- Final task is **default** taks- Rake runs default task if you do not provide a specific task name when you invoke Rake
- Each task has two Rake methods: `desc` and `task`.
  - `desc` method provides short description rake displays when you run `rake -T` and
  - `task` associates name with either a block of Ruby(lines 2-4 and 7-9) or list of dependencies(line 12)

## Why Do I Need Rake?
- Every project that aims to produce a finished project has repetitive tasks the developer needs.  Such as:
  - Run all tests associated with the program
  - Increment the version number
  - Create your release notes
  - Make a complete backup of your local repo

- `Rakefile` likely has each of tehse as a separate task, as well as a single overall task (called `release`) that steps through the tasks one at a time.  The release task would only stop when it completes all the tasks or one of the tasks fails.

## A Real World Example