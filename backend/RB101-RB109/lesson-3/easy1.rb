1.
numbers = [1, 2, 2, 3]
numbers.uniq
puts numbers

It will print out
1
2
2
3

because Array#uniq does not mutate the caller, Array#uniqu did not modify the numbers Object, the object that numbers variable points to. Instead it returned a new Array with unqiue elements.


The puts method
--------------
If called with an array argument, it writes each element on a new line. If the given object is not a string or array, it will be converted by calling it's to_s method

The p method
------------
Calls obj.inspect on its argument.

The inspect method
------------------
Ex. Array#inspect, Integer#inspect, Object#inspect...
Returns a string containing a human-readable representation of obj.

2.
! appended at the end of method name usually means that this method mutates the caller

? appended at the end of method name usually means that this method will return a boolean,
it is doing a validation check of some sort.

! or ? is part of the method name, and you would need to look at the actual method implementation to see what the method actually does.

!= means "not equal", you should use it in a conditional when comparing one object to another

? : is the ternary operator for if...else

! before something, like !user_name means to turn the object into the opposite of their boolean equivalent.
If the truthy value is false, then prepending it with a single ! will convert it to true.
If the truthy value is true, then prepending it with a single ! will convert it to false.

!! before something, like !!user_name means if user_name was truthy, convert it to false, then convert false to true. !! turns any object into their boolean equivalent.

3.
advice.gsub!(/important/, 'urgent')

4.
numbers = [1, 2, 3, 4, 5]
numbers.delete_at(1)
removes the element in the array at index 1
numbers will be [1,3,4,5]

numbers.delete(1)
removes the element in the array with the value 1
numbers will be [2,3,4,5]

Both methods are mutating.

5.
(10..100).cover?(42)
Returns true if obj is between the begin and end of the range.

6.