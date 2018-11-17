# Assertions
In previous assignment, we saw how to use `assert_equal` to make an assertion about the equality of two objects.

Sometimes we will want to make different types of assertions, such as raising a specific error or that something is printed out to std out, or an object is of a specific class, or something must be `nil`, or not `nil`, etc.

|Assertion|	Description|
|:----|:----|
| assert(test)	| Fails unless test is truthy.|
| assert_equal(exp, act) | Fails unless exp == act. |
| assert_nil(obj)	| Fails unless obj is nil.|
| assert_raises(*exp) { ... } | Fails unless block raises one of *exp. |
| assert_instance_of(cls, obj)	| Fails unless obj is an instance of cls. |
| assert_includes(collection, obj)	| Fails unless collection includes obj. |

