             ***** Notes *****
             -----------------

Operations to apply a function or two different functions to an element of the outer list.
Various additional operations on lists that have additional intermediate Monads inside. 

* Operations to apply a function or two different functions to an element of the outer list (some of them create inner list).

* Unsafe (in general) operations that can lead to intermediate Monads. 

Unsafe functions, in which one of the intermediate results (or even both) is in the Monad, can have an unpredictable behaviour.
Use them ONLY if you surely know what you are doing. It's your responsibility to check whether the code does what you expect.
