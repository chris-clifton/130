# Closure
- A general programming concept that allows programmers to save a "chunk of code" and execute it at a later time.
- It is called a "closure" because it is said to bind it's surrounding artifacts (i.e. variables, methods, objects, etc.) and build
  an "enclosure" around everything so they can be referenced when the closure is later executed.
- closures are implemented in Ruby through a `Proc` object
- we can pass around a Proc as a chunk of code and execute it later
- the Proc object retains references to its binding // the chunk of code retains references to its surrounding artifacts.

# Three Main Ways to Work with Closures
- Instantiating object from Proc class
- using lambdas
- using blocks

