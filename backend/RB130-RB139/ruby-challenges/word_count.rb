=begin
Problem: Given a string of words, return a hash with the word counts

Rules:
- ignore puncutation
- number strings are valid words
- case insensitive: go and GO are same word
- apostropes within a word is valid: don't
- quotations are not valid: 'large' is just large

Data structure:
- Input: String
- Output: Hash

Algo: 
- initialize empty hsh
- downcase the string
- Convert the string to an array of words
- Use String#scan with the regex: /[a-z]+[']*[a-z]+|[0-9]+/
- Loop over each word of the array of words
- hsh[word] = array.count(word)
- return hsh
=end

class Phrase
  def initialize(phrase)
    @phrase = phrase.downcase
  end

  def word_count
    occurences = {}
    words = @phrase.scan(/[a-z]+[']*[a-z]+|[0-9]+/)

    words.each do |word|
      occurences[word] = words.count(word)
    end

    occurences
  end
end

