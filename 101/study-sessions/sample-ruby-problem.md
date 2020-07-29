

https://www.codewars.com/kata/57a5b0dfcf1fa526bb000118/train/ruby

### Problem

Define a method that removes duplicates from an array of numbers and returns it as a result.
The order of the sequence has to stay the same.

*Note: Let's return a new array instead of mutating the original one*

*Note: don't use ruby built-in Array#uniq method*

### Example test cases

```ruby
# All test cases should return true
p distinct([1]) == [1]
p distinct([1, 2]) == [1, 2]
p distinct([1, 1, 2]) == [1, 2]
p distinct([1, 1, 1, 2, 3, 4, 5]) == [1, 2, 3, 4, 5]
p distinct([1, 2, 2, 3, 3, 4, 4, 5, 6, 7, 7, 7]) == [1, 2, 3, 4, 5, 6, 7]
```



---



### Understand the Problem 

- [x] Read the problem 
- [x] Write out the problem in your **own words**

```
- Define a Ruby method that takes in one argument: an array of integers
- Remove the duplicates of the array
- Return a new array without the duplicates, while maintaining the original order 
```



### Understand the Test Cases

- [x] Read each test case carefully

- [x] Read the **input** and **output** of each test case

- [x] verify the test cases match your understanding of the problem

  

**one element array with no duplicates:**

```
distinct([1]) == [1]
```

**two element array with no duplicates:**

```ruby
distinct([1, 2]) == [1, 2]
```

**three element array with a duplicated value:** 

```ruby
distinct([1, 1, 2]) == [1, 2]  # extra 1 is removed
```

**array with more than 3 elements and a duplicated value:**

```ruby
 distinct([1, 1, 1, 2, 3, 4, 5]) == [1, 2, 3, 4, 5] # two 1's are removed
```

**array with more than 3 elements and mutiple duplicated values:** 

```ruby
distinct([1, 2, 2, 3, 3, 4, 4, 5, 6, 7, 7, 7]) == [1, 2, 3, 4, 5, 6, 7]
```



### Data Structure 

- [x] Understand the data that's given and returned in the problem

**Input:** **An Array** with one or more integers as it's element(s)

**Output:** Return a **new Array** of one or more integers, with duplicates removed, and maintain original order



### Algorithm

- [x] In plain english, write out the instructions of what you need to do
  1. Initialize an empty array called result. The result array will hold only unique values. 
  2. Iterate through the elements of the Array, one by one
  3. During each iteration, check for duplicates:
     - if the result array doesn't have this number, append it
     - if the result array already has this number, don't append it
  4. Once the iteration is complete, return the result



### Algorithm - Pseudocode

- [x] Rewrite your instructions into pseudocode

1. `result = []`
2. Use `Array#each` to iterate through each element of the Array
3. Check if the element is a duplicated value: 
   - Use `Array#include?` to check if result array has this element
   - If result does not have this element, use `Array#<<` to append it
4. `return result` 



### Code

```ruby
def distinct(seq)
  result = []
  
  seq.each { |n| result << n if !result.include? n }
  
  result
end
```