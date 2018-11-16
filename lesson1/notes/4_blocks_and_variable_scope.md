# Blocks and Variable Scope
A Refresher
- Local variable scope exists in terms of 'inner' and 'outer' scope, determined by where the local variable is initialized.
- A block creates a new scope for local variables and only outer local variables are accessible to inner blocks
- Always look where local variable was initialized to determine it's scope

# Closure and Binding
Closure
- general computing concept of a "chunk of code" you can pass around and execute later
- In Ruby, this "chunk" is represented by a `Proc` object and blocks are a kind of `Proc`.
- Procs keep track of its surrounding context and drags it around wherever the chunk of code is passed to.  This is called it's **binding**, or it's surrounding environment/context.
- A closure must keep track of its surrounding context in order to have all the info it needs when its executed later.
  - This includes local variables, method references, constants, and other artifacts in your code.
  - Seems to violate local variable scoping rules
