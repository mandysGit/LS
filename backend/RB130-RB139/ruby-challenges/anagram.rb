=begin
Problem:
- Given an array of words, and a single word
- Return the subset of words in the array that are anagrams

Rules:
- it's not an anagram if it's the identical word
- case sensitive

data structure:
- input: one word - a string, one or many words - an array of words
- output: an array 

algo:
- Iterate through the array of words, Array#select
- check if any of the words are anagrams of the given word

- is_anagram?(word1, match_word)
  - return false if word1 == match_word
  - use String#chars to iterate every letter of match_word
    - Delete 'char' from temp_word
  - if temp_word is empty and word and match word are same size, then it's an anagram

- return the result of anagrams
=end

# class Anagram
#   def initialize(match_word)
#     @match_word = match_word.downcase
#   end

#   def match(list)
#     list.select { |word| anagram?(word) }
#   end

#   def anagram?(word)
#     return false if @match_word == word.downcase
#     temp = word.downcase.clone
#     @match_word.each_char { |char| temp.slice!(char) }

#     temp.empty? && @match_word.size == word.size
#   end
# end
   
class Anagram
  def initialize(match_word)
    @match_word = match_word
  end

  def match(list)
    list.select { |word| anagram?(word) }
  end

  def anagram?(word)
    @match_word.downcase != word.downcase &&
    word.downcase.chars.sort == @match_word.downcase.chars.sort
  end
end

