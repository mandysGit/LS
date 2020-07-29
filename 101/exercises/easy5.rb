# 1. ASCII String Value
# =====================
def ascii_value(str)
  str.chars.inject(0) do |sum, character|
    sum + character.ord
  end
end

# Further Exploration
# char.ord.chr == char

# p ascii_value('Four score') == 984
# p ascii_value('Launch School') == 1251
# p ascii_value('a') == 97
# p ascii_value('') == 0

=begin
2. After Midnight (Part 1)
==========================
input: Integer, minutes before or after midnight
        - negative means before
        - positive means after
output: String, in 24 hour format (hh:mm)

Algorithm: 
1. IF Input String is equal to zero
    return "00:00"

2. IF Input String is less than zero || Input String is grearer than zero 
    Retrieve Minutes
      1. GET the remainder of Input String (total minutes) MOD 60
          - This will give the remaining minutes, an integer between 0 - 59
      2. Format the minute string
          - If it is less than 10, prepend a zero infront
          - return minute string

    Retrieve Hours 
      1. GET the number of hours by dividing amount of minutes by 60
      2. Format hours String if it's positive
          - Between 0..9, prepend a zero
          - Between 10..23, don't prepend anything

          - If it is greater than 23, or if it is less than zero
              - convert_hours = hours MOD 24 (HOURS PER DAY)
              - This will give the remaining hours that did not divide evenly into 24. 
              - A number between 0 - 23
              - Format hours string by prepending zero if it's less than 10

3. Return "Hours:Minutes"
=end 

MINUTES_PER_HOUR = 60
HOURS_PER_DAY = 24

def minutes(int)
  minutes = int % MINUTES_PER_HOUR
  minutes < 10 ? "0#{minutes}" : "#{minutes}"
end

def hours (int)
  hours = int / MINUTES_PER_HOUR
  case hours
  when 0..9
    "0#{hours}"
  when 10..23
    "#{hours}"
  else
    converted_hours = hours % HOURS_PER_DAY
    converted_hours < 10 ? "0#{converted_hours}" : "#{converted_hours}"
  end
end

def time_of_day(int)
  return "00:00" if int == 0 
  return "#{hours(int)}:#{minutes(int)}"
end

# Further Exploration
TIME = Time.new(2019, 11, 24)
SECONDS_PER_MINUTE = 60
def time_of_day2(minutes)
  (TIME + (SECONDS_PER_MINUTE * minutes)).strftime("%A %H:%M")
end

# p time_of_day2(35) == "Sunday 00:35"
# p time_of_day2(800) == "Sunday 13:20"
# p time_of_day2(3000) == "Tuesday 02:00"
# p time_of_day2(0) == "Sunday 00:00"
# p time_of_day2(-3) == "Saturday 23:57"
# p time_of_day2(-1437) == "Saturday 00:03"
# p time_of_day2(-4231) == "Thursday 01:29"

##################################

# p time_of_day(35) == "00:35"
# p time_of_day(800) == "13:20"
# p time_of_day(3000) == "02:00"

# p time_of_day(0) == "00:00"

# p time_of_day(-3) == "23:57"
# p time_of_day(-1437) == "00:03"
# p time_of_day(-4231) == "01:29"

=begin
# 3. After Midnight (Part 2)
Input: String, HH:MM format
Output: Integer, number of minutes after or before midnight

Algorithm
---------
After Midnight
1. SET hours = (InputString[0] + Input String[1]) and convert to Integer
2. SET minutes = (InputString[3] + Input String[4]) and convert to Integer
3. IF hours is 24, return minutes
3. If hours is not 24, return hours * MINUTE_PER_HOUR + minutes

Before Midnight
Return zero if it's midnight
1. SET hours = (InputString[0] + Input String[1]) and convert to Integer
2. SET minutes = (InputString[3] + Input String[4]) and convert to Integer
3. IF hours is 24 or zero, return 23 hours and (60 - minutes)
4. Return (23 - hours) and (60 - minutes)
=end

def after_midnight(str)
  hours = (str[0] + str[1]).to_i
  minutes = (str[3] + str[4]).to_i
  return minutes if hours == 24
  return (hours * MINUTES_PER_HOUR) + minutes
end

def before_midnight(str)
  return 0 if str == '00:00' ||  str == '24:00'

  hours = (str[0] + str[1]).to_i
  minutes = (str[3] + str[4]).to_i

  if hours == 24 || hours == 0
    (MINUTES_PER_HOUR - minutes) + (23 * MINUTES_PER_HOUR) 
  else
    ((23 - hours) * MINUTES_PER_HOUR) + (MINUTES_PER_HOUR - minutes) 
  end
end

# Further Exploration
require 'time'

def after_midnight2(str)
  time = Time.parse(str)
  return time.min if time.hour == 0
  return (time.hour * MINUTES_PER_HOUR) + time.min
end

def before_midnight2(str)
  time = Time.parse(str)
  return 1440 - time.min if time.hour == 0
  return 1440 - time.min - (time.hour * time.min)
end

# p after_midnight2('00:00') == 0
# p after_midnight2('12:34') == 754
# p after_midnight2('24:00') == 0

# p before_midnight('00:00') == 0
# p before_midnight('12:34') == 686
# p before_midnight('24:00') == 0
# p before_midnight('00:59') == 1381

=begin
4. Letter Swap
--------------
Input: String, words separated by spaces
Output: String, words separted by spaces, with first and last chars swapped

Rules: 
- every word contains at least one letter
- Input String will be at least one word
- Input String contains only words and spaces

Algorithm
---------
1. SET array to hold each word of Input String. Use String#split
2. ITERATE through the array
3. Use Array#map! to transform the array
    - For each word in the array: 
    - SET last_letter = word[-1]
    - SET first_letter = word[0]
    - word[0] = last_letter
    - word[-1] = first_letter
    - return new_word to array
4. SET swapped String = convert array to string, each element separted by a space. Array#join(' ')
5. return swapped String
=end

def swap(str)
  array = str.split

  array.each do |word|
    first_letter = word[0]
    last_letter = word[-1]
    word[0] = last_letter
    word[-1] = first_letter
  end

  array.join(' ')
end

# p swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
# p swap('Abcde') == 'ebcdA'
# p swap('a') == 'a'

=begin
5. Clean up the words
---------------------
input: String, words and non alpha characters
output: String, with non-alpha characters replaced by single space

Rules: 
- One or more non-alpha characteres occur, only replace it with one space
- result should not have consecutive spaces

Algorithm: 
1. SET alpha_characters = all lower and upper case alphabet characters
2. SET previous_char = alpha
3. loop through string, on each iteration
      1. Check if character is alpha by using String#include? on alpha_string
        - If character is alpha 
          - Leave char in the string
          - previous_char = alpha

        - If character is NON-alpha && previous_char = alpha
          - replace with a space
          - previous_char = non-alpha

        - If character is NON-alpha && previous_char = nonalpha
          - remove char from string
          - previous_char = non-alpha
4. return string
=end

def cleanup(str)
  alpha_characters = "abcdefghijklmnopqrstuvwxyz"
  previous_char = 'alpha'
  input_array = str.chars
  new_array = []

  input_array.each do |current_char|
    if alpha_characters.downcase.include?(current_char)
      new_array << current_char
      previous_char = 'alpha'
    elsif !alpha_characters.downcase.include?(current_char) && previous_char == 'alpha'
      new_array << ' '
      previous_char = 'non-alpha'
    elsif !alpha_characters.downcase.include?(current_char) && previous_char == 'non-alpha'
      previous_char = 'non-alpha'
    end
  end

  new_array.join
end

# refactored
def cleanup2(str)
  alpha_characters = "abcdefghijklmnopqrstuvwxyz"
  new_array = []

  str.chars.each do |current_char|
    if alpha_characters.downcase.include?(current_char)
      new_array << current_char
    else 
      new_array << ' ' if new_array.last != ' '
    end
  end

  new_array.join
end

# p cleanup("---what's my +*& line?") == ' what s my line '

=begin
6. Letter Counter (Part 1)
--------------------------
input: String, one word, or multiple words separated by spaces 
output: Hash, key: length of word, value: number of words with that length

Rules: 
- word is string of characters that do not include a space

Algorithm: 
1. Use String#split to create an array with each word as an element
2. Iterate through the array using Array#map. SET transformed array as word_lengths
    - return length of word

3. SET keys = word_lengths.uniq
4. SET hash = empty hash
5. ITERATE over keys
    - Array#count to count the key in word_lengths
    - insert count value into Hash as {key => word_length.count(key)}
6. return hash
=end

def word_sizes(str)
  word_lengths = str.split.map {|word| word.length }
  keys = word_lengths.uniq
  hash = {}

  keys.each { |key| hash[key] = word_lengths.count(key) }
  
  hash
end

# p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
# p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
# p word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
# p word_sizes('') == {}

# 7. Letter Counter (Part 2)
# --------------------------
def word_sizes(str)
  word_lengths = str.split.map {|word| word.count('aA-zZ') }
  keys = word_lengths.uniq
  hash = {}

  keys.each { |key| hash[key] = word_lengths.count(key) }
  
  hash
end

# p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
# p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
# p word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
# p word_sizes('') == {}

# 8. Alphabetical Numbers
# --------------------------
ENGLISH_NUMBER = {
  0 => 'zero' ,
  1 => 'one' ,
  2 => 'two' ,
  3 => 'three',
  4 => 'four' ,
   5 => 'five' ,
   6 => 'six' ,
   7 => 'seven' ,
   8 => 'eight' ,
   9 => 'nine' ,
   10 => 'ten',
   11 => 'eleven',
   12 => 'twelve',
   13 => 'thirteen',
   14 => 'fourteen',
   15 => 'fifteen',
   16 => 'sixteen',
   17 => 'seventeen',
   18 => 'eighteen',
   19 => 'nineteen'
}
def alphabetic_number_sort(array)
  alpha_array = array.map {|num| ENGLISH_NUMBER[num]}
  alpha_array.sort.map {|english_num| ENGLISH_NUMBER.key(english_num)}
end

# p alphabetic_number_sort((0..19).to_a) == [
#   8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
#   6, 16, 10, 13, 3, 12, 2, 0
# ]

=begin
9. ddaaiillyy ddoouubbllee
--------------------------
input: String
output: New string, consecutive duplicate characters collapsed into single char

Algorithm
1. SET new_string = ''
2. ITERATE through input string
3. append char to new_string unless char is equal to new_string[-]
4. return new_string
=end

def crunch(str)
  new_string = ''
  counter = 0

  loop do 
    break if counter >= str.size 
    new_string << str[counter] unless new_string[-1] == str[counter]
    counter += 1
  end

  new_string
end

# Further Exploration
def crunch2(str)
  new_string = ''

  str.each_char do |char|
    new_string << char unless new_string[-1] == char
  end

  new_string
end

def crunch3(str)
  new_string = ''

  str.chars.each do |char|
    new_string << char unless new_string[-1] == char
  end

  new_string
end

def crunch4(str)
  str.gsub(/(.)\1+/, '\1')
end

# p crunch('ddaaiillyy ddoouubbllee') == 'daily double'
# p crunch('4444abcabccba') == '4abcabcba'
# p crunch('ggggggggggggggg') == 'g'
# p crunch('a') == 'a'
# p crunch('') == ''

# p crunch2('ddaaiillyy ddoouubbllee') == 'daily double'
# p crunch2('4444abcabccba') == '4abcabcba'
# p crunch2('ggggggggggggggg') == 'g'
# p crunch2('a') == 'a'
# p crunch2('') == ''

# p crunch3('ddaaiillyy ddoouubbllee') == 'daily double'
# p crunch3('4444abcabccba') == '4abcabcba'
# p crunch3('ggggggggggggggg') == 'g'
# p crunch3('a') == 'a'
# p crunch3('') == ''

# p crunch4('ddaaiillyy ddoouubbllee') == 'daily double'
# p crunch4('4444abcabccba') == '4abcabcba'
# p crunch4('ggggggggggggggg') == 'g'
# p crunch4('a') == 'a'
# p crunch4('') == ''

# 10 Bannerizer
# ============
def horizontal(length)
  puts '+ ' + "- "*length + '+'
end 

def vertical(length)
  puts '| ' + "  "*length + '|'
end

def print_in_box(str)
  horizontal(str.size/2)
  vertical(str.size/2)
  puts '| ' + str + '|'    
  vertical(str.size/2)
  horizontal(str.size/2)
end

# Further Exploration
=begin
Algorithm:
1. ITERATE through string
2. Use String#slice to print strings index 0, with length 60
3. String#delete! to delete strings that we just printed out
4. print strings index 0, with length 60
5. STOP iterating when str.size is 0
=end 

TERMINAL_LENGTH = 80

def print_in_box2(str)
  if str.size < TERMINAL_LENGTH
    print_in_box(str)
  else
    length = TERMINAL_LENGTH/2
    horizontal(length)
    vertical(length)

    while str.size != 0
      if str.size < TERMINAL_LENGTH
        puts "| #{str[0, TERMINAL_LENGTH]}#{" "*(TERMINAL_LENGTH-str.size)}|"
        break
      end
      puts "| #{str[0, TERMINAL_LENGTH]}|"
      str.delete_prefix!(str[0, TERMINAL_LENGTH])
      
    end
    vertical(length)
    horizontal(length)
  end
end

# print_in_box2('To boldly go where no one has gone before.')
# print_in_box2('Welcome!!!')
# print_in_box2('')
# print_in_box2('Modify this method so it will truncate the message if it will be too wide to fit inside a standard terminal window (80 columns, including the sides of the box). For a real challenge, try word wrapping very long messages so they appear on multiple lines, but still within a box.')

# 9 Spin Me Around In Circles
# ============================

def spin_me(str)
  str.split.each do |word|
    word.reverse!
  end.join(" ")
end

spin_me("hello world") # "olleh dlrow"

=begin
str.split returns an array
Array#join(' ') returns a string

The string returned is a new string, it is not the original.
It returns a different object.
=end

