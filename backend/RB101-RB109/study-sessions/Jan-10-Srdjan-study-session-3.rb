# Write a function that will return the count of distinct case-insensitive alphabetic characters and numeric digits that occur more than once in the input string. The input string can be assumed to contain only alphabets (both uppercase and lowercase) and numeric digits.

=begin
Problem: Return the count of the amount of characters or digits that occur more than once in the String

Input: String
Output: Integer

Algo:
- initialize result = 0
- Use String#chars, and use Array#uniq to get an array of all the characters
- Iterate through characters, use Array#each
- On each char, use String#count, str.count(char)
- IF str.count(char) > 1
- result += 1

return result
=end

def duplicate_count(str)
  result = 0
  str.downcase.chars.uniq.each { |char| (result += 1) if str.downcase.count(char) > 1 }
  result
end

# p duplicate_count("") == 0
# p duplicate_count("abcde") == 0
# p duplicate_count("abcdeaa") == 1
# p duplicate_count("abcdeaB") == 2
# p duplicate_count("Indivisibilities") == 2


# Write a function called that takes a string of parentheses,
#  and determines if the order of the parentheses is valid.
#   The function should return true if the string is valid,
#    and false if it's invalid.
#
# Examples
# "()"              =>  true
# ")(()))"          =>  false
# "("               =>  false
# "(())((()())())"  =>  true

=begin
Problem: Return true or false depending on if the parentheses is ordered correctly, with opening and matching closing brackets

Input: String of parentheses
Output: Boolean

Algo:
- initialize bracket_count = 0, 0 means it's balanced
- Use String#chars to get an array of brackets
- Iterate through the Array
- IF bracket == '('
- increment bracket_count
- IF bracket == ')'
- decrement bracket_count

bracket_count == 0
=end

def valid_parentheses(str)
  bracket_count = 0
  str.chars do |bracket|
    if bracket == '('
      bracket_count += 1
    elsif bracket == ')'
      bracket_count -= 1
        if bracket_count < 0
          return false
        end
    end
  end

  bracket_count == 0
end

p valid_parentheses( "()" ) == true
p valid_parentheses("(())((()())())") == true

p valid_parentheses("((())))(") == false
p valid_parentheses("((())))(()") == false
