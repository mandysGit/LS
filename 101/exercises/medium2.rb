require 'pry'
=begin
1. Longest Sentence
====================
Input: text file
Output: 
- Print two things:
- String, longest sentence in the file based on words
- String, number of words in the longest sentence

Rules:
- Sentences may end with period, exclamation, or question marks
- any sequence of characters that are not spaces,  or sentence ending characters is a word


Algorithm:
subprocess: parsing the file
- open text file
- read the text file
- initialize text variable as the file's text

subprocess: longest_sentence
- Use String#split and regex, text.split(/[.|?|!]/) to split up each sentence into elements of an Array
- Loop through the Array, use Array#reduce to find the longest sentence
  - use the subprocess: number_of_words to determine the longer sentence

subprocess: number_of_words
- takes in one argument, a String sentence
- Use String#split to convert string to array that holds elements that are each word of the string
- Use Array#size to return the number of words

- return longest sentence and number of words
=end

def number_of_words(str)
  str.split.size
end

def longest_sentence(text)
  longest = text.split(/[.|?|!]/).reduce do |longest, sentence|
    number_of_words(longest) > number_of_words(sentence) ?
    longest :
    sentence
  end
  
  puts longest
  puts "------------------------------------"
  puts "The longest sentence in this book is #{longest.split.size} words long."
end

# text = ''

# File.open("file.txt").each do |line|
#   text << line
# end

# longest_sentence(text)

# Further Exploration
# ===================
# Use a positive lookbehind regular expression (i.e. ?<=) inside a parenthesis capture group to keep the delimiter at the end of each string

def longest_sentence2(text)
  longest = text.split(/(?<=[.|?|!])/).reduce do |longest, sentence|
    number_of_words(longest) > number_of_words(sentence) ?
    longest :
    sentence
  end
  
  puts longest
  puts "------------------------------------"
  puts "The longest sentence in this book is #{longest.split.size} words long."
end

# longest paragraph
def longest_paragraph(text)
  longest = text.split(/\n\n/).reduce do |longest, sentence|
    number_of_words(longest) > number_of_words(sentence) ?
    longest :
    sentence
  end
  
  puts longest
  puts "------------------------------------"
  puts "The longest paragraph in this book is #{longest.split.size} words long."
end

# text = ''

# File.open("file.txt").each do |line|
#   text << line
# end

# longest_paragraph(text)

# longest word
def longest_word(text)
  longest = text.split.reduce do |longest, word|
    longest.length > word.length ?
    longest :
    word
  end
  
  puts longest
  puts "------------------------------------"
  puts "The longest word in this book is #{longest.size} letters long."
end


# text = ''

# File.open("file.txt").each do |line|
#   text << line
# end

# longest_word(text)

=begin
2. Now I Know my ABCs
============================
Input: String, a word

Output: Boolean

Rules:
- valid words do not contain both letters from any given block
- Each block can only be used once

Data struture:
- A collection of spelling blocks, two letters per block
{
  ['b','0'] => 'not used',
  ['n','a'] => 'used'
}

Algorithm:
- SET hash, where the key is an array that contains the two letters of the block, and the value is "not used" or "used"

- Use String#downcase on input string to convert characters to lowercase
- Use String#chars to create an Array of elements that is each character
- initalize valid = true
- Iterate through each character of the array

  - Iterate on the keys of the hash 
  - If key includes character
    - check the value
    - If value is "not used", change to used
    - if value is "used", set valid to false
=end

def block_used?(block, char)
  block.include?(char)
end

def validate_block(blocks, block)
  if blocks[block] == "not used"
    blocks[block] = "used"
    return true
  else
    return false
  end
end

def block_word?(word)
  blocks = {
    ['b','0'] => 'not used',
    ['g','t'] => 'not used',
    ['v','i'] => 'not used',
    ['x','k'] => 'not used',
    ['r','e'] => 'not used',
    ['l','y'] => 'not used',
    ['d','q'] => 'not used',
    ['f','s'] => 'not used',
    ['z','m'] => 'not used',
    ['c','p'] => 'not used',
    ['j','w'] => 'not used',
    ['n','a'] => 'not used',
    ['h','u'] => 'not used',
  }
  validate_block_word = true

  word.downcase.chars do |char|
    blocks.keys.each do |block|
      if block_used?(block, char)
        valid_block_word = validate_block(blocks, block)
      end
    end
  end

  valid_block_word
end

# p block_word?('BATCH') == true
# p block_word?('BUTCH') == false
# p block_word?('jest') == true

=begin
3. Lettercase Percentage Ratio 
==============================
Input: String
Output: Hash, keys: lowercase, uppercase, neither. values: percentage.

Rules: string will always contain at least one character

Algorithm:
- initalize 2 constants, uppercase, lowercase, using regex /[A-Z]/, /[a-z]/
- Convert String to Array, use String#chars
- initalize empty hash
- initialize total = array.size.to_f
- initalize lowercase = 0
- initalize uppercase = 0
- initalize neither = 0

- Iterate through the array
- use case statement to match each item with lower, upper, and neither constants
- increment lowercase, uppercase, or neither depending on the match

- hsh[:lowercase] = lowercase/ total
- hsh[:uppercase] = uppercase/ total
- hsh[:neither] = neither/ total

- return hash
=end

UPPPERCASE = /[A-Z]/
LOWERCASE = /[a-z]/

def create_hash(total, lowercase, uppercase, neither)
  hsh = {}

  hsh[:lowercase] = (lowercase/total)*100
  hsh[:uppercase] = (uppercase/total)*100
  hsh[:neither] = (neither/total)*100

  hsh
end

def create_hash_2_decimal_places(total, lowercase, uppercase, neither)
  hsh = {}

  hsh[:lowercase] = format("%.2f", (lowercase/total)*100).to_f
  hsh[:uppercase] = format("%.2f", (uppercase/total)*100).to_f
  hsh[:neither] = format("%.2f", (neither/total)*100).to_f

  hsh
end

def letter_percentages(str)
  total = str.chars.size.to_f
  lowercase = 0
  uppercase = 0
  neither = 0

  str.chars.each do |char|
    case char
    when UPPPERCASE
      uppercase += 1
    when LOWERCASE
      lowercase += 1
    else
      neither += 1
    end
  end

  create_hash_2_decimal_places(total, lowercase, uppercase, neither)
end

# p letter_percentages('abCdef 123') == { lowercase: 50, uppercase: 10, neither: 40 }
# p letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25 }
# p letter_percentages('123') == { lowercase: 0, uppercase: 0, neither: 100 }

# Further Exploration
# ====================
# p letter_percentages('abcdefGHI') == {:lowercase=>66.67, :uppercase=>33.33, :neither=>0.0}

=begin
4. Matching Parentheses?
========================
Input: String
Output: Boolean, if all parenthesis in string are properly balanced

Rules:
- To be properly balanced, parentheses must occur in matching '(' and ')' pairs

Algorithm:
- initalize parentheses_need_pair = 0
- initalize counter = 0
- Convert input String to Array, Use String#char
- Iterate through Array, use until do end

- until counter >= Array.size || parantheses_need_pair < 0
- If item == '(' then parentheses_need_pair += 1
- If item == '?' then parentheses_need_pair -= 1

- If parentheses_need_pair > 0 or negative return false
- If parentheses_need_pair == 0 return true
=end

def balanced?(str)
  parentheses_need_pair = 0
  counter = 0
  characters = str.chars

  until counter >= characters.size || parentheses_need_pair < 0
    parentheses_need_pair += 1 if characters[counter] == '('
    parentheses_need_pair -= 1 if characters[counter] == ')'
    counter += 1
  end

  parentheses_need_pair == 0
end

# p balanced?('What (is) this?') == true
# p balanced?('What is) this?') == false
# p balanced?('What (is this?') == false
# p balanced?('((What) (is this))?') == true
# p balanced?('((What)) (is this))?') == false
# p balanced?('Hey!') == true
# p balanced?(')Hey!(') == false
# p balanced?('What ((is))) up(') == false

# Further Exploration
# ===================
# other characters should be matched:
# - Square brackets
# - Curly brackets
# - Quotation marks (single and double)
def any_pairs_unbalanced?(*pairs)
  [*pairs].any? { |pair| pair < 0 }
end

def all_pairs_balanced?(*pairs)
  [*pairs].all?(0)
end

def extended_balanced?(str)
  round = 0
  square = 0
  curly = 0
  double_quotes = 0
  single_quotes = 0
  open_double_quote = true
  open_single_quote = true

  str.chars.each do |character|
    case character
    when '(' then round += 1
    when ')' then round -= 1
    when '[' then square += 1
    when ']' then square -= 1
    when '{' then curly += 1
    when '}' then curly -= 1
    when '"'
      open_double_quote ? double_quotes += 1 : double_quotes -= 1
      open_double_quote = !open_double_quote
    when "'"
      open_single_quote ? single_quotes += 1 : single_quotes -= 1
      open_single_quote = !open_single_quote
    end
    break if any_pairs_unbalanced?(round, square, curly, double_quotes, single_quotes)
  end

  all_pairs_balanced?(round, square, curly, double_quotes, single_quotes)
end

# False test cases
# ---------------
# round brackets
# p extended_balanced?('What is) this?') == false
# p extended_balanced?('What (is this?') == false
# p extended_balanced?('((What)) (is this))?') == false
# p extended_balanced?(')Hey!(') == false
# p extended_balanced?('What ((is))) up(') == false

# square brackets
# p extended_balanced?('What is] this?') == false
# p extended_balanced?('What [is this?') == false
# p extended_balanced?('[[What]] [is this]]?') == false
# p extended_balanced?(']Hey![') == false
# p extended_balanced?('What [[is]]] up[') == false

# curly brackets
# p extended_balanced?('What is} this?') == false
# p extended_balanced?('What {is this?') == false
# p extended_balanced?('{{What}} {is this}}?') == false
# p extended_balanced?('}Hey!{') == false
# p extended_balanced?('What {{is}}} up{') == false

# Double quote
# p extended_balanced?('What is" this?') == false
# p extended_balanced?('What "is this?') == false
# p extended_balanced?('""What"" "is this""?') == false

# single quote
# p extended_balanced?("What is' this?") == false
# p extended_balanced?("What 'is this?") == false
# p extended_balanced?("''What'' 'isthis''?") == false


# Mixed
# p extended_balanced?('What][ "is" this?') == false
# p extended_balanced?('(What (is "this"?') == false
# p extended_balanced?('{[What]} "is this""?') == false
# p extended_balanced?('((Hey!))(""{}[]') == false


# True test cases
# ---------------
# round brackets
# p extended_balanced?('What (is) this?') == true
# p extended_balanced?('((What) (is this))?') == true
# p extended_balanced?('Hey!') == true

# square brackets
# p extended_balanced?('What [is] this?') == true
# p extended_balanced?('[[What] [is this]]?') == true

# curly brackets
# p extended_balanced?('What {is} this?') == true
# p extended_balanced?('{{What} {is this}}?') == true

# double quotation marks
# p extended_balanced?('What "is" this?') == true
# p extended_balanced?('""What" "is this""?') == true

# single quotation marks
# p extended_balanced?("What 'is' this?") == true
# p extended_balanced?("''What' 'is this''?") == true


=begin
5. Triangle Sides
=================
Input: 3 Integers
Output: Symbol, :equilateral, :isosceles, :scalene, or :invalid

Rules:
- equilateral All 3 sides are of equal length
- isosceles 2 sides are of equal length, while the 3rd is different
- scalene All 3 sides are of different length
- Valid triangle: 
    - all sides must have lengths greater than 0
    - sum of two shortest sides > longest side 
- invalid: 
  - at least one side is <= 0
  - sum of two shortest sides <= longest side

Algorithm:
- subprocess invalid_triangle?, returns symbol or false: 
- Store input Integers as elements in an Array
- use Array#any? to check for <= 0 side
- Use Array#max to retrieve max_side
- Use Array#index to retrieve index of max_side
- Use Array#each_with_index to retrieve sum of the shorter sides, as long as those sides do not equal to max_side

- subprocess: equilateral?
- return :equilateral if all elements are not equal, s1 === s2 === s3

- subprocess: scalene?
- return :scale if all elements are not equal, s1 !== s2 !== s3

- subprocess: isosceles?
- return :isosceles if s1 == s2 || s2 === s3 || s1 === s3
=end

def invalid?(s1, s2, s3)
  sides = [s1, s2, s3]
  max_side = sides.max
  max_side_index = sides.index(max_side)
  
  
  sum_shorter_sides = 0
  sides.each_with_index do |side, index|
    sum_shorter_sides += side if index != max_side_index
  end
  
  return :invalid if sides.any? { |side| side <= 0 }
  return :invalid if sum_shorter_sides <= max_side
  false
end

def equilateral?(s1, s2, s3)
  return :equilateral if s1 == s2 && s2 == s3
  false
end

def scalene?(s1, s2, s3)
  return :scalene if s1 != s2 && s2 != s3
  false
end

def isosceles?(s1, s2, s3)
  return :isosceles if s1 == s2 || s2 == s3 || s1 == s3
  false
end 

def triangle(s1, s2, s3)
  invalid?(s1, s2, s3) ||
  equilateral?(s1, s2, s3) ||
  scalene?(s1, s2, s3) ||
  isosceles?(s1, s2, s3)
end

# p triangle(3, 3, 3) == :equilateral
# p triangle(3, 3, 1.5) == :isosceles
# p triangle(3, 4, 5) == :scalene
# p triangle(0, 3, 3) == :invalid
# p triangle(3, 1, 1) == :invalid

=begin
6. Tri-Angles 
==============
Input: 3 Integers, angles
Output: Symbol, :acute, :right, :obturse, :invalid

Rules:
- Invalid:
  - Sum of all 3 angles != 180
  - at least one angle is <= 0
- Acute: All 3 angles are < 90
- Right: one angle == 90 degrees
- Obtuse: one angle is > 90

Algorithm:
- Use a CASE statement to validate the conditions for each triangle, and return the correct symbol
- WHEN: a1 + a2 + a3 != 180 || (a1 <= 0 || a2 <= 0 || a3 <=0)
- THEN: INVALID

- WHEN (a1 < 90 && a2 < 90 && a3 <90)
- THEN: ACUTE

- WHEN Use Enumerable#one? [a1, a2, a3].one? {|angle| angle == 90 }
- THEN: RIGHT

- WHEN Use Enumerable#one? [a1, a2, a3].one? {|angle| angle > 90 }
- THEN: OBTUSE
=end

def triangle(a1, a2, a3)
  case 
  when (a1 + a2 + a3) != 180 || (a1 <= 0 || a2 <= 0 || a3 <=0)
    :invalid
  when (a1 < 90 && a2 < 90 && a3 <90)
    :acute
  when [a1, a2, a3].one? { |angle| angle == 90 }
    :right
  when [a1, a2, a3].one? { |angle| angle > 90 }
    :obtuse
  end
end

# p triangle(60, 70, 50) == :acute
# p triangle(30, 90, 60) == :right
# p triangle(120, 50, 10) == :obtuse
# p triangle(0, 90, 90) == :invalid
# p triangle(50, 50, 50) == :invalid

=begin
7. Unlucky Days 
================
Input: Integer, Year
Output:  Integer, Number of Friday the 13ths

Rules:
- assume input year is greater than 1752

Questions: 
- What day does the Year start on? Mon, Tues, Wed..?
- How many days in each Month? 

Algorithm:
- initalize count_friday_13th = 0
- require 'date'
- Use Integer#upto, 1.upto(12) to check each month's Friday
  - Initalize new Date object, Use Date.new(input year) and set it as variable date
  - date + 12
  - date.friday? if true, increment count_friday_13th
- return count_friday_13th
=end
require 'date'

def friday_13th(year)
  count_friday_13th = 0

  1.upto(12) do |month|
    date = Date.new(year, month, 13)
    count_friday_13th += 1 if date.friday?
  end
  count_friday_13th
end

# p friday_13th(2015) == 3
# p friday_13th(1986) == 1
# p friday_13th(2019) == 2

# Further Exploration
#####################
# Given the year, count the number of months that have five Fridays
# Account for leap years

def fridays_in_a_month(year, month)
  fridays = 0
  date = Date.new(year, month)
  
  if month == 12 # December
    until date.year == year + 1
      fridays += 1 if date.friday?
      date = date.next_day
    end
  else # January - November
    until date.month == month + 1
      fridays += 1 if date.friday?
      date = date.next_day
    end
  end


  fridays
end

def fridays_months(year)
  months_count = 0
  month = 1
  date = Date.new(year)

  until month > 12
    months_count += 1 if fridays_in_a_month(year, month) == 5 
    month += 1
  end
  
  months_count
end

# p fridays_months(2019) == 4
# p fridays_months(2021) == 5

# # leap years
# p fridays_months(2012) == 4
# p fridays_months(2024) == 4

=begin
8. Next Featured Number Higher than a Given Value 
=================================================
Input: Integer
Output: Integer, returns next feature number greater than input Integer
- error message if no next featured number

Rules:
- featured number: 
- odd
- multiple of 7
- digits do not repeat

Algorithm:
- generate featured number that is greater than input integer
- initalize multiply variable as 0
- initalize featured_number as 0
- loop until featured_number?(featured_number) is true and featured_number is greater than input Integer
- Increment multiply

subprocess: featured_number?
- takes in one argument, an integer
- returns true if:
- it's odd, use Integer#odd?
- digits do not repeat:
  - use Integer#digits to convert to an Array
  - Compare array.size with array.uniq.size
  - If same size, digits don't repeat

Error handling: 
- if input integer is 9_999_999_999 or greater
- return error message
=end

def featured(num)
  return "There is no possible number that fulfills those requirements" if num >= 9_999_999_999

  multiply = (num/7)
  featured_number = 7 * multiply

  until featured_number?(featured_number) && (num < featured_number)
    multiply += 1 
    featured_number = 7 * multiply
  end

  featured_number
end

def featured_number?(num)
  num.odd? && num.digits.size == num.digits.uniq.size
end

# p featured(12) == 21
# p featured(20) == 21
# p featured(21) == 35
# p featured(997) == 1029
# p featured(1029) == 1043
# p featured(999_999) == 1_023_547
# # p featured(999_999_987) == 1_023_456_987
# p featured(9_999_999_999) == "There is no possible number that fulfills those requirements"

=begin
9. Bubble Sort 
===============
Input: 
Output:  

Algorithm:
- initalize iteration variable as true


- outer loop: break if iteration equals false
  - initalize index = 0
  - initalize next_index = 1
  - initalize swap_happened = false
  
- inner loop: Iterate through input array
  - break if index >= array.size
  - IF array[index] > array[next_index]
      SWAP: 
      - array[index], array[next_index] = array[next_index], array[index]
      - SET swap_happened = true  
  - increment index
  - increment next_index

- SET iteration false if swap_happened is false

=end

def bubble_sort!(array)
  iteration = true

  until iteration == false
    index = 0
    next_index = 1
    swap_happened = false

    until next_index >= array.size
      if array[index] > array[next_index]
        array[index], array[next_index] = array[next_index], array[index]
        swap_happened = true
      end
      index += 1
      next_index += 1
    end

    iteration = false if swap_happened == false
  end
end

# array = [5, 3]
# bubble_sort!(array)
# p array == [3, 5]

# array = [6, 2, 7, 1, 4]
# bubble_sort!(array)
# p array == [1, 2, 4, 6, 7]

# array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
# bubble_sort!(array)
# p array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)

# Further Exploration
def optimized_bubble_sort!(array)
  length = array.size

  until length <= 1
    index = 0
    new_length = 0

    until index >= array.size - 1
      if array[index] > array[index + 1]
        array[index], array[index + 1] = array[index + 1], array[index]
        new_length = index
      end
      index += 1
      length = new_length
    end
  end
end

# array = [5, 3]
# optimized_bubble_sort!(array)
# p array == [3, 5]

# array = [6, 2, 7, 1, 4]
# optimized_bubble_sort!(array)
# p array == [1, 2, 4, 6, 7]

# array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
# optimized_bubble_sort!(array)
# p array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)

=begin
10. Sum Square - Square Sum 
============================
Input: Integer
Output:  Integer, The difference between square of sum and sum of squares

Rules:
- example:
sum_square_difference(3) == 22
   # -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)

Algorithm:
- initalize square_of_sums as 0
- initalize sum_of_squares as 0

Use Integer#upto to loop over n (input Integer) times
  - increment square_of_sums each loop by n
  - increment sum_of_squares each by n**2

- square_of_sums = square_of_sums**2

return square_of_sums - sum_of_squares
=end

def sum_square_difference(n)
  square_of_sums = 0
  sum_of_squares = 0

  1.upto(n) do |n|
    square_of_sums += n 
    sum_of_squares += n**2
  end

  square_of_sums**2 - sum_of_squares
end

# p sum_square_difference(3) == 22
#    # -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
# p sum_square_difference(10) == 2640
# p sum_square_difference(1) == 0
# p sum_square_difference(100) == 25164150
