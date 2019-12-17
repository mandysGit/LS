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

# p rotate_string('hello') == 'elloh'
# p rotate_integer(1234) == 2341
# p rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
# p rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
# p rotate_array(['a']) == ['a']

# x = [1, 2, 3, 4]
# p rotate_array(x) == [2, 3, 4, 1]   # => true
# x == [1, 2, 3, 4]                 # => true

=begin
2. Rotation (Part 2)
====================
Input: Two Integers, the number, last n digits of a number
Output: Integer, the rotated number

Rules: 
- rotating 1 digit results in original number
- n is always positive

Algorithm:
- Convert Input Integer to String, Use Integer#to_s, initalize it as string
- Retrieve the substring by reference, string[0...-n], initalize it as substring
- Retrieve the rest of the string by reference, string[-n..-1], initialize it as rotate_substring
- Rotate the rotate_substring, use rotate_string method
- return rotate_substring + substring
=end

def rotate_rightmost_digits(num, n)
  string = num.to_s
  substring = string[0...-n]
  rotate_substring = string[-n..-1]

  result = substring + rotate_string(rotate_substring)
  result.to_i
end

# p rotate_rightmost_digits(735291, 1) == 735291
# p rotate_rightmost_digits(735291, 2) == 735219
# p rotate_rightmost_digits(735291, 3) == 735912
# p rotate_rightmost_digits(735291, 4) == 732915
# p rotate_rightmost_digits(735291, 5) == 752913
# p rotate_rightmost_digits(735291, 6) == 352917

=begin
3. Rotation (Part 3)
====================
Input: An Integer
Output: An Integer, maxium rotated Integer

Rules: 
- Maximum rotation means every substring from the right has it's rightmost digit rotated

Algorithm:
- initalize result = input integer converted to string, Use Integer#to_s
- initalize counter = 1

- loop until counter is equal or greater than string.size - 1
  - initalize left_digits = result[0...counter]
  - initalize right_digits = result[counter..-1]
  - rotated_right_digits = rotate_string(right_digits)
  - result = left_digits + rotated_right_digits
  - increment counter 

= return result.to_i
=end

def max_rotation(num)
  result = num.to_s
  counter = 0

  until counter >= num.to_s.size - 1
    left_digits = result[0...counter]
    right_digits = result[counter..-1]
    rotated_right_digits = rotate_string(right_digits)
    result = left_digits + rotated_right_digits
    counter += 1
  end

  result.to_i
end

# p max_rotation(735291) == 321579
# p max_rotation(3) == 3
# p max_rotation(35) == 53
# p max_rotation(105) == 15 # the leading zero gets dropped
# p max_rotation(8_703_529_146) == 7_321_609_845

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