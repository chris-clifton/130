# SEAT APPRROACH  
- Optimize testing setup by set up once outside of each test and then just run assertions on it

- SEAT Approach:
  - **S**et up the necessary objects
  - **E**xecute the code against the object we're testing
  - **A**ssert the results of the execution
  - **T**ear down and clean up any lingering artifacts

- The `setup` method will be called before running every test
  - Use an instance variable to house an instance of the object you want to test
  - Some tests, like testing instantiation without proper arguments, will require a new instantiation of the object so you won't be able to use instance variable
