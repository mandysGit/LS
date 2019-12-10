=begin
1. Sum of Sums
===============
Input: An Array of Numbers
Output: Integer, total sum of each leading sequence

Rules: Array always contains at least one number

Algorithm:
1. SET sum = 0
2. SET counter = 0
3. ITERATE through input Array
4. break loop if counter >= length of Array
5. Use Array#slice to get the range of numbers
6. Use Array#sum to get the sum of the range of numbers in Array, and reset sum as the old sum plus new sum
7. return sum
=end

def sum_of_sums(arr)
  sum = 0
  counter = 1
  
  until counter > arr.size
    sum += arr.slice(0, counter).sum
    counter += 1
  end

  sum
end

# p sum_of_sums([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
# p sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
# p sum_of_sums([4]) == 4
# p sum_of_sums([1, 2, 3, 4, 5]) == 35

=begin
2. Madlibs
===========
Input: 
Output: 

Rules:

Algorithm:
=end

=begin
3. Leading Substrings
======================
Input: 
Output: 

Rules:

Algorithm:
=end

=begin
4. All Substrings
==================
Input: 
Output: 

Rules:

Algorithm:
=end

=begin
5. Palindromic Substrings
==========================
Input: 
Output: 

Rules:

Algorithm:
=end

=begin
6. fizzbuzz
============
Input: 
Output: 

Rules:

Algorithm:
=end

=begin
7. Double Char (Part 1)
========================
Input: 
Output: 

Rules:

Algorithm:
=end

=begin
8. Double Char (Part 2)
========================
Input: 
Output: 

Rules:

Algorithm:
=end

=begin
9. Convert number to reversed array of digits
=============================================
Input: 
Output: 

Rules:

Algorithm:
=end

=begin
1. Get the Middle Character
============================
Input: 
Output: 

Rules:

Algorithm:
=end