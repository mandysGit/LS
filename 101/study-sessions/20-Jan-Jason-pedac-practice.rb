=begin
Given an array of integers, Find the minimum sum which is obtained from summing each Two integers product.

Notes:
- Array/list will contain positives only
- Array/list will always has even size
=end

p min_sum([5,4,2,3]) == 22 # 5*2 + 3*4 = 22
p min_sum([12,6,10,26,3,24]) == 342 # 26*3 + 24*6 + 12*10 = 342
p min_sum([9,2,8,7,5,4,0,6]) == 74 # 9*0 + 8*2 +7*4 +6*5 = 74
p min_sum([1,2]) == 2
p min_sum([]) == 0

=begin
Problem: 
- What's the input given? 
- What are you going to do with the input? 
- What are you going to return?

Problem:
- Given an Array of Integers
- Two pairs of integers are multiplied together (largest * smallest)
- Save all the products in an Array
- Sum up all the numbers in the products Array 

Problem: 
- Given an Array of Integers
- Sort the Array
- Multiply the first and last Integers, store that in sum
- Return Sum
=end

###########################################################################
=begin
Given a number, Return The Maximum number that could be formed from the digits of the number given.

Notes:
- Only Natural numbers passed to the method, numbers Contain digits [0:9] inclusive
- Digit Duplications could occur, So also consider it when forming the Largest

=end

p max_number(213) == 321
p max_number(7389) == 9873
p max_number(63729) == 97632
p max_number(566797) == 977665
p max_number(17693284) == 98764321

=begin
Problem: 
- What's the input given? 
- What are you going to do with the input? 
- What are you going to return?

Problem: 
- Given an Integer
- Rearrange the numbers to create the maxium number that can be formed with the digits
- The largest numbers are on the left, and the numbers following it will be equal or less 
- Sort the digits descending order
=end

###########################################################################

=begin
The year of 2013 is the first year after the old 1987 with only distinct digits.

Problem: given a year number, find the minimum year number which is strictly larger than the given one and has only distinct digits.

[input] integer year
1000 ≤ year ≤ 9000

[output] an integer

The minimum year number that is strictly larger than the input number year and all its digits are distinct.
=end

p distinct_digit_year(1987) == 2013
p distinct_digit_year(2013) == 2014
p distinct_digit_year(2229) == 2301

=begin
Problem:
- Given a year number
- Find the minimum year larger than the given year that has all unique digits
  - Increment the year by 1 to get a new year
  - Check new year for unique digits 
  - Remove duplicates and check the length of the number with and without duplices
=end

###########################################################################
=begin
Given a string that includes alphanumeric characters ('3a4B2d')
return the expansion of that string: The numeric values represent the occurrence of each letter preceding that numeric value. 

Rules: 
- no numeric characters in the final string
- Empty strings should return an empty string
- The first occurrence of a numeric value should be the number of times each character behind it is repeated, until the next numeric value appears
- If there are two consecutive numeric characters the first one is ignored
- If there are two consecutive alphabetic characters then the first character has no effect on the one after it
- Your code should be able to work for both lower and capital case letters.
=end

p string_expansion('3abc') == 'aaabbbccc'        
p string_expansion('abcde') == 'abcde'           
p string_expansion('3D2a5d2f') == 'DDDaadddddff' 
p string_expansion('3d332f2a') == 'dddffaa'      
p string_expansion('') == ''                     
p string_expansion('3abc') != 'aaabc'           
p string_expansion('3abc') != 'abcabcabc'  

=begin
Problem: 
- Given a string that contains numbers and letters
- create a new string with repeating letters based on the preceding numeric value
    - store the occurence of the num in a variable
    - multiply the letters by the num
- Return the new string
=end