=begin
1. Rotation (Part 1)
====================
Input: Array 
Output: New Array, where first element is moved to the end of Array

Rules: 
- Dont' use Array#rotate
- don't modify the original Array

Algorithm:
- Object#dup to create shallow copy of input Array and save it as result
- initalize first_elm as first element of result, use Array#shift 
- Use Array#push to insert the first_elm in last position
=end

def rotate_array(arr)
  result = arr.dup
  first_elm = result.shift
  result << first_elm

  result
end

# Further Exploration
def rotate_string(str)
  rotate_array(str.chars).join
end

def rotate_integer(int)
  rotate_array(int.to_s.chars).join.to_i
end

# p rotate_string('hello')
# p rotate_integer(1234)
# p rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
# p rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
# p rotate_array(['a']) == ['a']

# x = [1, 2, 3, 4]
# p rotate_array(x) == [2, 3, 4, 1]   # => true
# x == [1, 2, 3, 4]                 # => true

=begin
2. Rotation (Part 2)
====================
Input: 
Output: 

Rules: 

Algorithm:
=end

=begin
3. Rotation (Part 3)
====================
Input: 
Output: 

Rules: 

Algorithm:
=end

=begin
4. 1000 Lights
==============
Input: 
Output: 

Rules: 

Algorithm:
=end

=begin
5. Diamonds!
============
Input: 
Output: 

Rules: 

Algorithm:
=end

=begin
6. Stack Machine Interpretation
===============================
Input: 
Output: 

Rules: 

Algorithm:
=end

=begin
7. Word to Digit
================
Input: 
Output: 

Rules: 

Algorithm:
=end

=begin
8. Fibonacci Numbers (Recursion)
===============================
Input: 
Output: 

Rules: 

Algorithm:
=end

=begin
9. Fibonacci Numbers (Procedural)
=================================
Input: 
Output: 

Rules: 

Algorithm:
=end

=begin
10. Fibonacci Numbers (Last Digit)
==================================
Input: 
Output: 

Rules: 

Algorithm:
=end