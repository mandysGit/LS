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

p block_word?('BATCH') == true
p block_word?('BUTCH') == false
p block_word?('jest') == true

=begin
3. Lettercase Percentage Ratio 
==============================
Input: 
Output:  

Rules:


Algorithm:
=end

=begin
4. Matching Parentheses?
========================
Input: 
Output:  

Rules:


Algorithm:
=end

=begin
5. Triangle Sides
=================
Input: 
Output:  

Rules:


Algorithm:
=end

=begin
6. Tri-Angles 
==============
Input: 
Output:  

Rules:


Algorithm:
=end

=begin
7. Unlucky Days 
================
Input: 
Output:  

Rules:


Algorithm:
=end

=begin
8. Next Featured Number Higher than a Given Value 
=================================================
Input: 
Output:  

Rules:


Algorithm:
=end

=begin
9. Bubble Sort 
===============
Input: 
Output:  

Rules:


Algorithm:
=end

=begin
10. Sum Square - Square Sum 
============================
Input: 
Output:  

Rules:


Algorithm:
=end
