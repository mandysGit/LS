
# Write method scramble(str1,str2) that returns true if a portion of str1 characters can be rearranged to match str2, otherwise returns false.
#
# For example:
# str1 is 'rkqodlw' and str2 is 'world' the output should return true.
# str1 is 'cedewaraaossoqqyt' and str2 is 'codewars' should return true.
# str1 is 'katas' and str2 is 'steak' should return false.
#
# Only lower case letters will be used (a-z). No punctuation or digits will be included.

=begin
Problem:
- Given 2 strings
- return True or False if characters in str1 can be used to create str 2


Input: two Strings
Output: Boolean

Algo: 
- Convert str2 into an array of characters
- iterate over each character of str2
- Use String#include? to validate if char of str2 is in str1
- IF char of str2 is in str1
  - reassign the character as * in str1, to mark that it's been used
- ELSE
  - return false

- return true
=end

def scramble(str1, str2)
  str2.each_char do |char|
    if str1.include?(char)
      idx = str1.index(char)
      str1[idx] = '*'
    else
      return false
    end
  end

  true
end

# p scramble('javaass', 'jjss') == false
# p scramble('rkqodlw','world') == true
# p scramble('cedewaraaossoqqyt','codewars') == true
# p scramble('katas','steak') == false
# p scramble('scriptjava','javascript') == true
# p scramble('scriptingjava','javascript') == true



# You are given an array which contains only integers (positive and negative).
# Your job is to sum only the numbers that are the same and consecutive. The result should be one array.
# You can asume there is never an empty array and there will always be an integer.

=begin
Problem: 
- Given an Array of Integers
- Group the integers that are the same and consecutive into 2D Array
- Sum those integers that are the same and consecutive
- Return the sums in an Array

Input: Array of integers
Output: Output Array of Integers (Sums)

Rules: 
- never an empty array, and there will always be an Integer

Data structure:
- 2D Array

Algo: 
- Group the integers that are the "same and consecutive" in an 2D array
- initialize numbers_to_sum = []
- initialize same_nums = []
- Iterate through input Array
- IF same_num is empty or same_num.first == number
  - append it to same_nums 
- ELSE
  - append same_nums to numbers_to_sum using Array#<<
  - reassign same_nums to empty array
  - append n to same_numss

- For the last group
  - Append same_nums to numbers_to_sum if same_nums is not empty

- return numbers_to_sum
=end

def group_same_nums(arr)
  numbers_to_sum = []
  same_nums = []

  arr.each do |n|
    if same_nums.empty? || same_nums.first == n
      same_nums << n 
    else
      numbers_to_sum << same_nums
      same_nums = []
      same_nums << n 
    end
  end

  # for the last group
  numbers_to_sum << same_nums if !same_nums.empty?
  numbers_to_sum
end

def sum_consecutives(arr)
  group_same_nums(arr).map do |inner_array|
    inner_array.sum
  end
end

p sum_consecutives([1,4,4,4,0,4,3,3,1]) == [1,12,0,4,6,1]
p sum_consecutives([1,1,7,7,3]) == [2,14,3]
p sum_consecutives([-5,-5,7,7,12,0]) ==  [-10,14,12,0]