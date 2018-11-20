# Symbol to Proc

- When working with collections, we often want to transform all items in that collection.  
- Ex: we have an array of integers we want to transform to strings
```ruby
[1, 2, 3, 4, 5].map do |num|
  num.to_s
end

# => ["1", "2", "3", "4", "5"]

```
- The return value here is a new array where every element is now a string.
- This code is so common there is a shortcut
```ruby
[1, 2, 3, 4, 5].map(&:to_s)                     # => ["1", "2", "3", "4", "5"]
```
- This code iterates through every element in array, calls `to_s` on it, then saves result to new array.  After its done, new array is returned.  Since new array is returned, you can chain another transformation.
```ruby
[1, 2, 3, 4, 5].map(&:to_s).map(&:to_i)         # => [1, 2, 3, 4, 5]
```
- `&:` must be followed by a valid method that can be invoked on each element
- `&:` doesn't work for methods that take arguments
- `&:` will work on any collection method that takes a block

# symbol#to_proc
Consider the following code: 
```ruby
(&:to_s)
```
- The `&` tells Ruby to try to convert this object into a block
  - to do so, Ruby is expecting a `Proc` object
  - if the object is not a `Proc`, it will call `#to_proc` on the object
- Two main things are happening
  1. Ruby checks whether the object after `&` is a `Proc`.  If it is, it uses the object as-is.  Otherwise, it tries to call `#to_proc` on the object, which should return a `Proc` object.  An error will occur if this fails.
  2.  If all is well, the & turns the `Proc` into a block
- Ruby then tries to turn `:to_s` into a block

# Symbol to Block
A lone & applied to an object causes ruby to try to convert the object to a block. If that object is a proc, the conversion happens automagically, just as shown above. If the object is not a proc, then & attempts to call the #to_proc method on the object first. Used with symbols, e.g., &:to_s, Ruby creates a proc that calls the #to_s method on a passed object, and then converts that proc to a block. This is the "symbol to proc" operation (though perhaps it should be called "symbol to block").