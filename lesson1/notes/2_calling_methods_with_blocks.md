# Blocks
- A block is any code between `do`...`end` or between curly braces { and }
- A block can be an argument to a method call
- In following code: [1, 2, 3].each do { |num| puts num }
  - block is being passed in to the `Array#each` method.

# What can you do with a block?
- Why is it that sometimes the code in the block affects the return value and somtimes not?
- The code we write in the block is NOT the method implementation- in fact, it has nothing to do with the method implementation
- The entire block is passed in to the method, like any other argument, and its up to the method implementation to decide what to do with it
- The method could take the block and execute it, or, it could completely ignore it- its up to the method implementation