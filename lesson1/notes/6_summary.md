# Summary
- Beginning of the world of closures and blocks

- Blocks are just one way Ruby implements closures.  Procs and lambdas are others.
- Closures drag their surrounding environment/context around, and this is at the core of how variable scope works
- Blocks are great for pushing some decisions to method invocation time
- Blocks are great for wrapping logic, where you need to perform some before/after (sandwich code) actions.
- We can write our own methods that take a block with the `yield` keyword
- When we `yield`, we can also pass arguments to the block
- When we `yield`, we need to be aware of block's return value
- Once we understand blocks, we can re-implement many of the common methods in the Ruby core library in our own classes.
- The `Symbol#to_proc` is a nice shortcut when working with collections
