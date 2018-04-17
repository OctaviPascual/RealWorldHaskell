# Chapter 2: Types and Functions

1) What are the types of the following expressions?
    * False
    * (["foo", "bar"], 'a')
    * [(True, []), (False, [['a']])]

2)  Haskell provides a standard function, **last :: [a] -> a**, that returns the last element of a list. From reading the type alone, what are the possible valid behaviors (omitting crashes and infinite loops) that this function could have? What are a few things that this function clearly cannot do?

The function last is a polymorphic function that takes a list of elements and returns a value that has the same type as the elements of the list.
It clearly cannot:
    * Return an element of a different type as the elements of the list
    * Return its argument unmodified

3) Write a function, **lastButOne**, that returns the element *before* the last.

[lastButOne.hs]

4) Load your **lastButOne** function into **ghci** and try it out on lists of different lengths. What happens when you pass it a list that’s too short?

If the list is empty, **init** function throws an exception.
If the list has one element, **last** function throws an exception.
