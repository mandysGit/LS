=begin
Consider a character set consisting of letters, a space, and a point. 

Words consists of one or more, but at most 20 letters.

An input text consists of one or more words separated from each other by one or more
spaces and terminated by 0 or more spaces followed by a point.

Input should be read from, and including the first letter of the first word, up to and including
the terminating point.

The output text is to be produced such that sucessive words are separated by a single space
with the last word being terminated by a single point. 

Odd words are copied in reverse order while even words are merely echoed.

For example,
"whats the matter with kansas." becomes "whats eht matter htiw kansas."

BONUS POINTS: the characters must be read and printed one at a time.

Problem:
- Character: letters, a space, and a point
- Words: one or more letters, max size is 1-20 letters
- Input: 
  - one or more words
  - delimited by one or more spaces
  - terminated by 0 or more spaces followed by a point
- Output:
  - sucessive words are delimited by one space
  - last word followed by single point
  - Odd words are reversed

Data Structure:
- Input: String
- Output: String

Algo: 
- Convert the String of words to an Array of words
  - String#scan use regex /[a-z]+/i to get an array of words
  - Array#map to iterate over the words
  - Enumerable#with_index
  
- Reverse all the odd words, words that have an odd index
  - If the index is odd, use String#reverse on the `word`

- Array#select to select all the words with size <= 20

- Join the array
- Append . to the final string
=end

def odd_words(text)
  result = text.scan(/[a-z]+/i)
               .map.with_index { |word, idx| idx.odd? ? word.reverse : word }
               .select { |word| word.size <= 20 }
               .join(' ')
               .concat('.')
  result
end


p odd_words("whats the matter with kansas.") == "whats eht matter htiw kansas."
p odd_words("hello   goodbye.") == "hello eybdoog."
p odd_words("hi.") == "hi."
p odd_words("bye greaterthantwentylettersword.") == "bye."

p odd_words("hello") == "hello."
p odd_words("hello word.") == "hello drow."
p odd_words("hello word .") == "hello drow."
p odd_words("hello  word .") == "hello drow."
p odd_words("hello word  .") == "hello drow."
p odd_words("hello word world .") == "hello drow world."
