# Minitest
- Minitest is default testing library that comes with Ruby, but many use RSpec
- Minitest can do everything RSpec can, and it uses a more straight forward syntax
 - RSpec bends over backwards to allow devs to write code that reads like English but at the cost of simplicity
 - RSpec is **DSL** or Domain Specific Language for writing tests

 # Vocabulary
 - **Test Suite**: this is the entire set of tests that accompanies your program or application.  All the tests for a project.
  - **Test**: A situation or context in which tests are run.  A test can contain multiple assertions
  - **Assertion**: The actual verificatioin step to confirm the data returned by program or application is indeed what is expected.  This is what we are trying to verify. You can make more than one assertions within a test.

 # What's in the test file?
 
- `require 'minitest/autorun'`
  - loads all necessary files from `minitest` gem- that's all we need to use Minitest
- `require_relative 'car'`
  - We're telling ruby to get the file we want to test, which contains the Car class.  `require_relative` specifies the file name in current file's directory
- `class TestClass < Minitest::Test`
  - create a class that subclasses from `Minitest::Test`, allowing test class to inherit all necessary methods for writing tests.

# `assert_equal`
- Since `assert_equal` is used inside an instance method, you can guess that `assert_equal` is an inherited instance method from somewhere up the hierarchy.
- `assert_equal` takes two parameters: the first is the expected value, and the second is the test or actual value.
- If there is a discrepancy between the two, `assert_equal` will save the error and Minitest will report that error to you at the end of the test run

# Reading Test Output
- first "seed" tells Minitest what order the tests were run in
  - most tests suites have many tests that are run in random order
    - the seed is how you tell Minitest to run the entire test suite in a particular order
    - this is rarely used but is sometimes helpful when you have an especially tricky bug that only comes up when certain specific situations come up
- The Dot.  The dot means the teste was run and nothing went wrong.  If you skip a test with the `skip` keyword, it'll say 'S'.  If you have a failure, it will say 'F'.  

# Errors
When a test fails, Minitest gives us important feedback.  You can see how many tests were run, how many assertions were made, how many failures and where.

# Skipping Tests
The keyword `skip` at the beginning of the test instance method is all you have to do to skip the test.
- Minitest will dutifully report that you have skipped tests in your suite, and output an 'S' instead of a dot for fully passed.
- You can pass a string into `skip` if you want a custon display message

# Expectation Syntax
In Expectation style, tests are grouped into `describe` blocks and individual tests are written with the `it` method.  We no longer use assertions and instead use *expectation matchers*.  

# Summary
- Minitest is an intuitive test library that comes with Ruby
- Using Minitest is very easy and you shouldn't be afraid to play around with it
- Create a test file by subclassing `MiniTest::Test`
- Create a test by creating an instance method that starts with `test_`
- Create assertions with `assert_equal` and pass it the expected value and actual value
- Colorize Minitest with the `minitest-reporters` gem
- You can skip tests with `skip`
- Minitest comes in two sytanx flavors: assertion style and expectation style.  Latter is to appease Rspec users, former is more intuitive for beginning Ruby devs


