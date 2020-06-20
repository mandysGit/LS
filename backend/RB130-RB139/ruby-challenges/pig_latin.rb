=begin
Pig Latin
Rule 1: if a word beings with vowel, add 'ay' to the end of word

Rule 2: if a word begins with a consonant, move it to the end of the word, and add 'ay'

Rule 3: if 'y' is followed by an vowel, treat it as a consonant. If 'y' is followed by a consonant, treat it as a vowel.

Rule 4: if 'x' is followed by a vowel, treat it as a consonant.
If 'x' is followed by a consonant, treat it as a vowel.

Given a String word or multiple words, return the piglatin string.

Data Structure:
input: string
output: string

Algo:
- Translate(words)
  - Split the input string to an Array of words
  - MAP over each word, and call convert_piglatin(`word`)
  - Conver the transformed array of words into a String, Array#join(' ')

- pig_latin(word)
  - Initialize vowels = 'aeioiu'
  - Initialize first = `word`[0]
  - Initialize second = word[1]

  - first char is Y or X
    - If `second` is consonant, then word[1...word.size] + first + `ay`
    - if `second` is vowel, then word + `ay`

  - first char is a vowel
    - return word + `ay`

  - first or multiple chars are a consonant
    - initialize consonants = ''
    - vowel_idx = 0
    - Iterate through `word` with index
      - If char is not included in vowels, append it to consonants
      - vowel_idx = i
      - Break if char is a vowels
    - Return mutated_word + consonants + `ay`
=end

# class PigLatin
#   def self.translate(words)
#     words.split.map { |word| pig_latin(word) }.join(' ')
#   end

#   def self.pig_latin(word)
#     first = word[0]
#     second = word[1]
    
#     if first == 'y' || first == 'x'
#       result = word[1...word.size] + first + 'ay' if vowel?(second)
#       result = word + 'ay' if !vowel?(second)
#       result
#     elsif vowel?(first)
#       word + 'ay'
#     else
#       consonants = ''
#       vowel_idx = 0

#       word.chars.each.with_index do |char, idx|
#         vowel_idx = idx

#         if char == 'u' && consonants[-1] == 'q'
#           consonants << char
#         elsif !vowel?(char)
#           consonants << char
#         else
#           break
#         end
#       end

#       word[vowel_idx...word.size] + consonants + 'ay' 
#     end
#   end

#   def self.vowel?(letter)
#     'aeiou'.include?(letter)
#   end
# end


# REFACTOR WITH REGEX

class PigLatin
  def self.translate(words)
    words.split.map { |word| translate_one(word) }.join(' ')
  end

  def self.translate_one(word)
    return "#{word}ay" if  vowel_sound?(word)
    "#{shorten(word)}#{consonants(word)}ay"
  end

  def self.consonants(word)
    word.match(/\A([^aeiou]+(qu)|^(qu)|[^aeiou]+)/)
  end

  def self.shorten(word)
    word.delete_prefix("#{consonants(word)}")
  end

  def self.vowel_sound?(word)
    word.match(/\A[aeiou]|[xy][^aeiou]/)
  end
end
