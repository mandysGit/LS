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
Input: 
Output:  

Rules:


Algorithm:
=end

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
