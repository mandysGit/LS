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
Input: 4 user inputs, noun, verb, adjective, adverb
Output: A sentence combining the user inputs 

Algorithm:
1. use Kernel#gets, String#chomp to get noun, verb, adjective, and adverb from user
2. Use string literal to inject those variables in a String
3. print out the string
=end

def madlibs
  print "Enter a noun: "
  noun = gets.chomp
  print "Enter a verb: "
  verb = gets.chomp
  print "Enter an adjective: "
  adjective = gets.chomp
  print "Enter an adverb: "
  adverb = gets.chomp

  puts "Do you #{verb} your #{adjective} #{noun} #{adverb}? That's hilarious!"
end

# madlibs

=begin
3. Leading Substrings
======================
Input: String
Output: Array, all substrings in shortest to longest order

Algorithm:
1. set substrings = [] 
2. set counter = 0

4. Iterate over String
5. Break loop when counter > String.size
7. Append char with index 0 until counter to substrings Array, Use String#slice 
9. increment counter

10. return substring
=end

def substrings_at_start(str)
  substrings = []
  counter = 1

  until counter > str.size
    substrings << str.slice(0, counter)
    counter += 1
  end

  substrings
end


# p substrings_at_start('abc') == ['a', 'ab', 'abc']
# p substrings_at_start('a') == ['a']
# p substrings_at_start('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']

=begin
4. All Substrings
==================
Input: string
Output: Array, containg all possible substrings

Rules: substrings to be returned from their position, and shortest to longest

Algorithm:
1. initalize an empty array called substrings
2. initalize an outer_start_index = 0
3. initalize an inner_start_index = 0

outer loop
break if outer_start_index >= str.size

    inner loop
    break if inner_start_index >= str.size
      - increment substring with str.slice(inner_start_index, )
    increment inner_start_index

increment outer_start_index
inner_start_index = outer_start_index

3. return the substrings array
=end

# Without using substrings_at_start
def substrings(str)
  substrings = []
  outer_start_index = 0
  inner_start_index = 0

  until outer_start_index >= str.size
    substring = ''
    until inner_start_index >= str.size
      substring += str[inner_start_index]
      substrings << substring
      inner_start_index += 1
    end

    outer_start_index += 1
    inner_start_index = outer_start_index
  end

  substrings
end


# Using substrings_at_start
def substrings2(str)
  substrings = []
  start_index = 0

  loop do 
    break if start_index >= str.size 
    substrings << substrings_at_start(str[start_index..-1])
    start_index += 1
  end

  substrings.flatten
end

# p substrings2('abcde') == [
#   'a', 'ab', 'abc', 'abcd', 'abcde', 
#   'b', 'bc', 'bcd', 'bcde',
#   'c', 'cd', 'cde',
#   'd', 'de',
#   'e'
# ]


=begin
5. Palindromic Substrings
==========================
Input: String
Output: Array, contains all palindrome substrings

Rules:
- Palindrome is a string with same sequence of characters forwards as it does backwards
- return value should be arranged in the same sequence as the substrings appear in the string
- Duplicate palindromes should be included
- use the substrings method
- pay attention to case: "AbcbA" is a palindrome, but neither "Abcba" nor "Abc-bA" are
- single characters do not count as palindrome

Algorithm:
1. Create palindrome? helper method
    - take in one argument as a string
    - compare the input string with reverse of the input string
    - return the result as a boolean
2. initalize palindromes as an empty array
3. initalize substrings and set it equal to the return value of invoking substrings(input_string)
4. Iterate over substrings, use Array#select
    - Pass in substring as an argument to palindrome? 
    - If it's true, append it to palindromes
5. return palindromes array
=end

def palindrome?(str)
  str == str.reverse && str.size > 1
end

def palindromes(str)
  substrings = substrings2(str)
  substrings.select { |substring| palindrome?(substring) }
end


def palindromes_ignore_case(str)
  substrings = substrings2(str)
  substrings.select { |substring| palindrome?(substring.downcase) }
end

# p palindromes('abcd') == []
# p palindromes('madam') == ['madam', 'ada']
# p palindromes('hello-madam-did-madam-goodbye') == [
#   'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
#   'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
#   '-madam-', 'madam', 'ada', 'oo'
# ]
# p palindromes('knitting cassettes') == [
#   'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
# ]
# p palindromes_ignore_case("Abcba") == ["Abcba", 'bcb']

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