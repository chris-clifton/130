# Testing Equality
- How does `assert_equal` test for equality?
  - tests based on **value equality**
  - we are invoking `==` method
  - if we want to look for object equality we use `assert_same` assertion
    - compares object id's and oid's are contained in output if you get error
  - Ex: 
  ```ruby
  str1 = "hi there"
  str2 = "hi there"
  assert_equal(str1, str2)
  assert_same(str1, str2)
  ```
  - `assert_equal` will pass because str1 and str2 point to same values
  - `assert_same` will fail because str1 and str2 are different objects

# Equality with a Custom Class
Because Ruby core library classes all implement sensible `==` to test for value equality, we can get away with using `assert_equal` on strings, arrays, hashes, etc. without any trouble.  For custome classes however, we need to tell Minitest how to make these comparisons.
- We achieve this by implementing our own `==` method.
- In this example, note the call to `is_a?` which prevents accidentally getting incorrect equality to object of another class that might also have a `name` getter to the same `name` instance variable
  ```ruby
  def ==(other) 
    other.is_a?(Car) && name == other.name
  end
  ```
- `assert_equal` would pass and `assert_same` would stil fail, and this is what we want
