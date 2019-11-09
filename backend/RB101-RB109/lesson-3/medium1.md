#### Medium 1 Exercises

----------------------------------------

3.

**Notes:**

Ruby Precedence

```
!, ~, unary + 
**
unary -
*, /, %
+, -
<<, >>
&
| ^
>, >=, <, <=
<==>, ==, ===, !=, =~, !~
&&
||
.., ...
?, :
modifier-rescue
=, +=, -=, etc.
defined?
not
or, and
modifier-if, modifier-unless, modifier-while, modifier-until
{ } blocks
```



Ruby supports "do/while" loops in this way. Although it's not recommended by Matz, the creator of Ruby. Using reserved keywords: `begin` ,`end`, and `while` .

```
begin
  puts "Do you want to do that again?"
  answer = gets.chomp
end while answer == 'Y'
```



**Answer:** 

```ruby
def factors(number)
  divisor = number
  factors = []
  loop do
    break if divisor <= 0
    factors << number / divisor if number % divisor == 0
    divisor -= 1
  end
  factors
end
```

What is the purpose of `number % divisor == 0` ? 

```
It's purpose is to validate that divisor is divisble into number without any remainders. For example, 4 % 2 == 0 is true, because 4 divides into 2 with zero remainders.
```

What is the purpose of the second-to-last line in the method? 

```
The "factors" before the method's "end" is the return value of the factors method. 
```



4.

The difference between `<<` method and `+` method for Array.

Array#<<

```
buffer << new_element
```

`<<` mutates the caller. It adds a new element to the array object that buffer variable is referencing. 

From the docs, "Append – Pushes the given object on to the end of this array. This  expression returns the array itself, so several appends may be chained  together."


Array#+

```
buffer = input_array + [new_element]
```

`=` does not mutate the caller. `buffer` variable references a new array object. This new array object's value is the concatenation of `input_arary` and `[new_element]`. 

From the docs, "Concatenation - returns a new array built by concatening the two arrays togehter to produce a third array."

