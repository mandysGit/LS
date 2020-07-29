# Practice problems from video part 2

=begin
Write a method that takes an array of strings, and returns an array of the
same string values, except with the vowels removed.

Problem: 
- Given an Array of Strings
- Return an Array with the same strings, modified to revove the vowels

Input: Array of String
Output: Array with same string, with vowels removed

Algo:
- initialize constant, VOWELS = 'aeiou'

- Iterate through input Array, use Array#map, set return value of map as new_array variable
- On each String, use String#delete!(VOWELS)

- return new_array
=end

VOWELS = 'aeiou'
def remove_vowels(arr)
  arr.map do |word|
    word.delete!(VOWELS)
  end
end

# p remove_vowels(['green', 'yellow', 'black', 'white']) == ['grn', 'yllw', 'blck', 'wht']

######################################################
=begin
Write a method that takes a string, and returns a boolean indicating 
whether this string has a balanced set of parentheses.

Input: String
Output: boolean

Problem: 
- Given a string
- validate if the parentheses in the string are balanced
- return true if it is balanced
- return false if it's not balanced

Algo: 
- initialize a balance = 0
- Use String#each_char
- IF char == '('
  - increment balance by 1
- IF char == ')'
  - decrement balance by 1
  - return false IF balance < 0

balance.zero?
=end

def balancer(str)
  balance = 0
  str.each_char do |char|
    if char == '('
      balance += 1
    elsif char == ')'
      balance -= 1
      return false if balance < 0
    end
  end
  # p balance
  balance.zero?
end

# p balancer("hi") == true
# p balancer("(hi") == false
# p balancer("(hi)") == true
# p balancer(")hi(") == false

###########################################################
=begin
Write a method that takes two numbers. It should print out all primes between
the two numbers. Don't use Ruby's 'prime' class.

Input: 2 Integers
Output: all primes between the two numbers

Rules:
- prime number is a number that cannot be multipled by two smaller numbers

Algo:
- initialize first integer as variable start, start = first int + 1
- initialize second integer as variale end
- initialize result = []

- Use Integer#upto to get every integer between the two numbers
- (start...end).each
- on each number
- IF prime?(number) , Append number to result, using Array#<<

- Iterate through result, use Array#each
- print(num)

- subprocess: prime?
- Takes in on integer
- initialize is_prime = true
- (2...Input Integer).each
- IF input integer MOD num == 0 then is_prime reassigned false
- return is_prime
=end

def prime?(int)
  is_prime = true

  (2...int).each do |num|
    is_prime = false if int % num == 0
  end

  is_prime
end


def find_primes(start, finish)
  result = []

  (start...finish).each do |num|
    result << num if prime?(num)
  end
  
  # puts result.join(', ')
end

find_primes(3, 10) # 3, 5, 7

###################################################
def interleave(arr1, arr2)
  result = []

  arr1.size.times do |idx|
    result << arr1[idx] << arr2[idx]
  end

  p result
end
p interleave([1,2,3], ['a','b','c']) == [1,'a',2,'b',3,'c']

########################################################################

=begin
Algo:
- Given a string
- initialize new_string = ''
- Loop through every element of the input string, string.each_char
- use String#prepend to place the element of the input string at front position of the new array
- new_string.prepend(element)

- return new_string
=end

# non-mutating
def reverse(str)
  new_string = ''
  str.each_char do |char|
    new_string.prepend(char)
  end

  new_string
end

=begin
Algo:
- Given a string
- initialize temp = string.clone
- input string.delete!(temp)

- Iterate over temp by using String#each_char
- String#prepend each char to input string

return str
=end
# mutating
def reverse(str)
  temp = str.clone
  str.delete!(temp)

  temp.each_char do |char|
    str.prepend(char)
  end
  str
end


p reverse('a') == 'a'
p reverse('') == ''
p reverse('abc') == 'cba'
p reverse('123abc') == 'cba321'