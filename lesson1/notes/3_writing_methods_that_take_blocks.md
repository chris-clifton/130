# Writing Methods that take Blocks

- Every method you write in ruby takes blocks
- In Ruby, every method can take an optional block as a implicit paramater- even though explicit parameters might give ArugmentError
- It looks as if the block isn't even being passed in at all- it doesn't always seem to be doing anything

# Yielding
- One way to invoke the passed-in block argument from within the method is using the `yield` keyword
  Two Rules
  1. The number of arguments at method invocation needs to match the method definition, regardless of whether or not we are passing in a block
  2. The Yield keyword executes the block
- Must give a block if you use keyword `yield` or you will get a LocalJumpError: no block given
- In order to allow calling the method with or without a block, we must wrap the call to `yield` in a conditional
  - only call `yield` when a block is passed to method and don't call `yield` when there's no block
  - we achieve this with `Kernel#block_given?`

# Passing Execution to the Block
- Method Implementation: method definition
- Method Invocation: calling the method
- Yielding "jumps" to somewhere else, then comes back to finish the rest of the method.  This is very similar to calling a method
  and this is why it's sometimes usefult o think of a block as an un-named or anonymous method (aka anonymous function)

# Yielding with an Argument
- Sometimes the block we pass into a method requires an argument
  - note that th eblock itself IS an argument into a method, so the fact that the block requires an argument adds an additional layer of complexity
  - variable between two pipes `|` is the parameter of the block, or the "block parameter"
    - within the block, the block parameter is a block local variable- scoped to the block
    - be careful block parameter has unique name and avoids variable shadowing
- blocks are one way Ruby implements the idea of a closure- the rules around enforcing the number of arguments you can call on a closure is called its "arity"
- blocks have lenient arity rules, which is why it won't complain if you pass in a different number of arguments
- blocks do not enforce argument count, unlike normal methods in Ruby

# Return Value of Yielding to the Block
- Blocks hve a return value determined based on the last expression in the block- just like normal methods
  - this implies that, just like normal methods, blocks can either mutate the argument with a destructive method call or return a value
  - Just like writing good methods, writing good blocks requires you to keep this distinction in mind

# When to Use Blocks in your Own Methods
- Many ways blocks can be useful but the two main use cases are
1. Defer some implementation code to the method invocation decision
    - two roles involved with any method: method implementor and method caller(could be same person/developer)
    - there are times when implementor is not 100% certain of how the method will be called.  Maybe 90% but wants to leave 10% up to method caller at method
    invocation time.
    - sort of like how `Array#select` allows us the flexibility of refining the method at method invocation time
    - as opposed to `select_odds` or `select_greater_than(num)`. These would work, you would just have to memorize them so they are less flexible than generic `select`
    - If you encounter a scenario where you're calling a method from multiple places, with one little tweak in each case, it may be a good idea
    to try implementing the method in a generic way by yielding to a block

2. Methods that need to perform some "before" and "after" actions - sandwich code
    - Sometimes you want to perform before and after code but aren't sure what goes in between and thats the point
   - Method implementor doesn't care- it can be before or after anything
    - time_it example

# Methods with an Explicit Block Parameter
- passing a block to a method explicitly
- comestimes you want a method to explicitly require a block; you do that by defining a parameter and prefixing it with an ampersands & in method definition
- example:   
```ruby
        def test(&block)
          puts "What's block? #{block}"
        end
        #=> #<Proc:ox004398482-4985dk(irb):59>
```
- the `&block` is a special parameter that converts the block argument toa simple `Proc` object
- allows us to pass the block to another method
- invoke the `Proc` object at any time with a call to `Proc#call`

# Summary
- blocks are one way Ruby implements closures
  - closures are a way to pass around an un-named "chunk of code" to be executed later
- blocks can take arguments, just like normal methods.  Unlike normal methods, blocks dont complain about wrong number of arguments
- Blocks return a value, just like normal methods.
- Blocks are a way to defer some implementation decisions to invocation time.  It allows method callers to refine a method at invocation time for a specific use case.
  - it allows method implementors to build generic methods that can be used in a variety of ways
- blocks are a good use case for "sandwich code" scenarios like closing a file automatically.