# Given a string of words, you need to find the highest scoring word.

# Each letter of a word scores points according to it's position in the alphabet:
# a = 1, b = 2, c = 3 etc.

# You need to return the highest scoring word as a string.

# If two words score the same, return the word that appears earliest in the original string.

# All letters will be lowercase and all inputs will be valid.



=begin
Input: String, words
Output: String, one word - with highest score

Rules:
- a = 1
- b = 2
- c = 3

Data structure:
- Hash
- key: word
- value: score

Algo:
- initialize constant alphabet = ['a'..'z']
- initialize an empty Hash as variable result
- Use String#split to convert input String to Array
- Iterate through the Array, each item is a word
  - result['word'] = find_score()

- Subprocess, find_score: Given ONE word, find it's score
- initialize score = 0
- Use String#chars to convert word string into Array of characters
- Iterate through Array
  - score += aplhabet.index(letter) + 1
- return score

subprocess: highest scoring word
- highest_score = result.values.max , gives highest score
- highiest_score_word = result.select {|key, _| key.value == highest_score}
=end

require 'pry'

ALPHABET = ('a'..'z').to_a

def find_score(word)
  score = 0
  word.chars do |char|
    score += ALPHABET.index(char) + 1
  end
  score
end

# p find_score('aaa')
# p find_score('abc')

def alphabet_score(str)
  result = {}
  str.split do |word|
    result[word] = find_score(word)
  end

  highest_score = result.values.max
  result.key(highest_score)
end

p alphabet_score('man i need a taxi up to ubud') == 'taxi'
p alphabet_score('what time are we climbing up the volcano') == 'volcano'
p alphabet_score('take me to semynak') == 'semynak'
p alphabet_score('aa b') == 'aa'
