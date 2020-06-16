=begin
A palindrome is a word that is spelled the same forward and backward.
For example, 'rotor' and 'redder' are palindromes, but 'motor' is not.

Write a method that can determine if a given string is a palindrome.

Rules: 
- ignore non letters, for example "no1" "3on" is considerd a plaindrome
- case insensitive
- can't use 'reverse' method
- can't use regex

Data Structure
input: String
output: boolean, true or false

Algo:
- ALPHA = (a..z).to_a
- Mutate the input string by using downcase!
- Extract all the letter characters from the string, store in variable `letters`
- initialize result as empty array
- Iterate through `letters` in reverse order, using counter and while
    - append letter to result
- return result == letters

BONUS: how would you solve this problem by only traversing the string once?
- have two pointers, one pointer on start, one pointer to the end
- if the two pointers are pointing to different letters, then it's not palindrome

Edge Cases: 
- is '' considered a valid palindrome?
- are single chars considered palindrome?

Notes(sub-programs):
- solve for strings with only letters
- solve for normal strings, with non-letters removed
- solve it with case insensitive requirements
=end

def palindrome(word)
  return true if word.size == 1

  alpha = ('a'..'z').to_a
  letters = word.chars.map(&:downcase)
  letters = letters.select { |letter| alpha.include?(letter) }
  backwards = []

  counter = -1

  while counter >= -letters.size
    backwards << letters[counter]
    counter = counter - 1
  end

  letters == backwards
end

# Refactored
def palindrome(word)
  normalize = word.downcase.chars.select { |char| ('a'..'z').include?(char) }.join
  normalize == backward(normalize)
end

def backward(word)
  backward = ''
  word.each_char { |char| backward.prepend(char) }
  backward
end

p palindrome('motor') == false
p palindrome('alula') == true
p palindrome('rotor') == true
p palindrome('RoToR') == true
p palindrome('no1,3on') == true
