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



5.

The error would be: 

```
undefined local variable or method `limit' for main:Object (NameError)
```

`limit` variable is not in the local scope of the `fib` method. `fib` is a method that does not have access to any local variables outside of its scope. We would need to pass in `limit` as an argument to fib method. To fix this, rewrite the code this way: 

```ruby
limit = 15

def fib(first_num, second_num, limit)
  while first_num + second_num < limit
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end
  sum
end

result = fib(0, 1, limit)
puts "result is #{result}"
```



6. 

```
output: 
34
```



7.

```
The family's data was mutated. The munsters variable references a Hash Object. After invoking the mess_with_demographics method with munster as an argument, it changed the value of the Hash object as is, and each family members age increased by 42, and their gender changed to "other". The "demo_hash" references the same Hash Object as "munster", it has the same object_id, but the values that the Hash Object has a reference to changes, such as the references to the Integer object and String object.  
```



8. 

```
puts rps(rps(rps("rock", "paper"), rps("rock", "scissors")), "rock")

rps(rps(rps("rock", "paper"), rps("rock", "scissors")), "rock")
rps(rps("paper", "rock"), "rock")
rps("paper", "rock")
"paper"
```



9.

```
bar(foo)
bar("yes")
"no"
```

