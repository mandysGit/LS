# 1. Searching 101
#======================
def searching_101
  array = []

  puts "==> Enter the 1st number:"
  num1 = gets.chomp.to_i
  array << num1

  puts "==> Enter the 2nd number:"
  num2 = gets.chomp.to_i
  array << num2

  puts "==> Enter the 3rd number:"
  num3 = gets.chomp.to_i
  array << num3

  puts "==> Enter the 4th number:"
  num4 = gets.chomp.to_i
  array << num4

  puts "==> Enter the 5th number:"
  num5 = gets.chomp.to_i
  array << num5

  puts "==> Enter the last number:"
  num6 = gets.chomp.to_i

  puts "The number #{num6} appears in #{array}." if array.include?(num6)
  puts "The number #{num6} appears in #{array}." if !array.include?(num6)
end

# 2. Arithmetic Integer
#======================
OPERATIONS = [:+, :-, :*, :/, :%, :**]

def prompt(msg)
  puts "==> #{msg}"
end

def arithmetic_integer
  prompt("Enter the first number:")
  num1 = gets.chomp.to_i

  prompt("Enter the second number:")
  num2 = gets.chomp.to_i

  OPERATIONS.each do |operation|
    prompt("#{num1} #{operation} #{num2} = #{[num1, num2].inject(operation)}")
  end
end

# Further Exploration
def arithmetic_integer2
  prompt("Enter the first number:")
  num1 = gets.chomp

  num2 = ''
  loop do
    prompt("Enter the second number:")
    num2 = gets.chomp
    break if num2.to_f != 0
    prompt("Only non-zero numbers are accepted.")
  end

  OPERATIONS.each do |operation|
    prompt("#{num1} #{operation} #{num2} = #{[num1.to_f, num2.to_f].inject(operation)}")
  end
end

=begin
3. Counting the Number of Characters
====================================
input: String with one or more words
output: Integer, the number of characters in the String that's not spaces

Algorithm:
1. Convert input String to an Array of substrings, each substring is separated by space. Use String#split
2. Set total_characters that will count the characters of word
3. Iterate through the Array of words, for each word, reassign the total_characters as the total_characters plus the word's length.
=end

def count_num_chars
  puts "Please write word or multiple words: "
  user_input = gets.chomp
  total_characters = 0

  user_input.split.each do |word|
    total_characters += word.size
  end

  puts "There are #{total_characters} characters in \"#{user_input}\"."
end

# count_num_chars

# 4. Multipling Two Numbers
# =========================
def multiply(num1,num2)
  num1*num2
end

# 5. Square
# =========
def Square(num)
  multiply(num,num)
end

def power(num, exponent)
  if exponent == 0
    1
  elsif exponent == 1
    num
  elsif exponent == 2
    multiply(num, num)
  elsif exponent > 2
    num * power(num, exponent-1)
  elsif exponent < 0
    1 / power(num, -exponent).to_f
  end
end

# 6. XOR
# ======
def xor?(value1, value2)
  if value1 && !value2
    true
  elsif !value1 && value2
    true
  else
    false
  end
end

def xor?(value1, value2)
  return true if value1 && !value2
  return true if !value1 && value2
  false
end
# p xor?(5.even?, 4.even?) == true
# p xor?(5.odd?, 4.odd?) == true
# p xor?(5.odd?, 4.even?) == false
# p xor?(5.even?, 4.odd?) == false

# 7. Odd Lists
# ============
def oddities(arr)
  new_array = []
  arr.each_index { |index| new_array << arr[index] if index.even? }
  new_array
end

def evens(arr)
  new_array = []
  arr.each_index { |index| new_array << arr[index] if index.odd? }
  new_array
end

def evens2(arr)
  counter = 1
  new_array = []
  loop do
    break if counter >= arr.size
    new_array << arr[counter]
    counter += 2
  end
  new_array
end

def evens3(arr)
  arr.select do |num|
    arr.index(num).odd?
  end
end

# p oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
# p oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
# p oddities(['abc', 'def']) == ['abc']
# p oddities([123]) == [123]
# p oddities([]) == []

# p evens([2, 3, 4, 5, 6]) == [3, 5]
# p evens([1, 2, 3, 4, 5, 6]) == [2, 4, 6]
# p evens(['abc', 'def']) == ['def']
# p evens([123]) == []
# p evens([]) == []

# p evens2([2, 3, 4, 5, 6]) == [3, 5]
# p evens2([1, 2, 3, 4, 5, 6]) == [2, 4, 6]
# p evens2(['abc', 'def']) == ['def']
# p evens2([123]) == []
# p evens2([]) == []

# p evens3([2, 3, 4, 5, 6]) == [3, 5]
# p evens3([1, 2, 3, 4, 5, 6]) == [2, 4, 6]
# p evens3(['abc', 'def']) == ['def']
# p evens3([123]) == []
# p evens3([]) == []

=begin
8. Palindromic Strings
======================
input: string
output: boolean indicating if the string is a palindromic string

Rules:
A palindrome reads the same forward and backward.

Algorithm:
1. Iterate input String from last letter to first
2. Compare last letter with first letter, second last letter with second letter...and so on..
3. If there's a character that is not equal, return false, otherwise return true
=end

# '  m  a  d  a  m'
#   -5 -4 -3 -2 -1
# size = 5

def palindrome?(str)
  counter = 0
  compare_index = -1
  result = true

  while counter < str.size && compare_index > -str.size
    if str[counter] != str[compare_index]
      result = false
      break
    end

    compare_index -= 1
    counter += 1
  end

  result
end

def palindrome2?(str)
  str == str.reverse
end

# p palindrome?('madam') == true
# p palindrome?('Madam') == false          # (case matters)
# p palindrome?("madam i'm adam") == false # (all characters matter)
# p palindrome?('356653') == true

# p palindrome?([1,1,1,1]) == true
# p palindrome?([1,2,3]) == false
# p palindrome?(['asfd','asdf','ff']) == false
# p palindrome?([{}, {}]) == true

# 9. Palindromic String (Part 2)
# =================================
def real_palindrome?(str)
  arr = str.downcase.chars.select do |char|
    "0987654321abcdefghijklmnopqrstuvwxyz".include?(char)
  end
  palindrome?(arr.join)
end

# p real_palindrome?('madam') == true
# p real_palindrome?('Madam') == true           # (case does not matter)
# p real_palindrome?("Madam, I'm Adam") == true # (only alphanumerics matter)
# p real_palindrome?('356653') == true
# p real_palindrome?('356a653') == true
# p real_palindrome?('123ab321') == false

# 10. Palindromic Numbers
# =======================
def palindromic_number?(num)
  palindrome?(num.to_s)
end

p palindromic_number?(4543) == true
p palindromic_number?(123210) == false
p palindromic_number?(22) == true
p palindromic_number?(5) == true
