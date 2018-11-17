# Why Write Tests?
- For beginners, tests help prevent regression.  When we make changes to our code, we don't have to manually test that everything still works.
- You can write tests first, if you like, or you can write your tests after implementation.  Most likely, you'll do some mixture of both.
- We will focus on unit testing since all testing tools and methodologies build upon this.

# Setting up Minitest 

Basic installation:
```ruby
gem install minitest
```

After that, add following to show color:
```ruby
gem install minitest-reporters
```

At top of every test file, you must write:
```ruby
require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

require_relative 'ACTUAL_FILE_GOES_HERE'
```

