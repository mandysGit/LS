=begin
The Deaf Rats of Hamelin
https://www.codewars.com/kata/the-deaf-rats-of-hamelin/ruby

The Pied Piper has been enlisted to play his magical tune
and coax all the rats out of town.

But some of the rats are deaf and are going the wrong way!

How many deaf rats are there?

Legend

   P  = The Pied Piper
   O~ = Rat going left
   ~O = Rat going right

Examples:
'~O~O~O~O P'      #== 0 (has 0 deaf rats)
'P O~ O~ ~O O~'   #== 1 (has 1 deaf rat)
'~O~O~O~OP~O~OO~' #== 2 (has 2 deaf rats)
=end

=begin
  Problem: Given a String, find how many rats are going away from P. aka. deaf rats
  Input: String
  Output: Integer
  
  Rules: 
  - ~O is valid (not deaf) if P is on the left of it
  - O~ is valid if P is on the right of it

  Algo: 
  - initialize count = 0
  - left_rat = 'O~'
  - right_rat = '~O'
  - Remove spaces from input string, Use String#delete(' ')
  - Retrieve index of 'P', Use String#index('P')

  - Subprocess: Get 2 substrings: before P, after P
    - before_P = String#slice(0...index of P)
    - after_P = String#slice(index of P + 1 ..-1)

  - Subpocess: Iterate through Before_P String to check for left rats
  - initialize idx = 0
  - loop through string, break when idx >= str.size - 1
  - increment count if before_P.slice(idx, 2) == left_rat

  - Subpocess: Iterate through after_P String to check for right rats
  - initialize idx = 0
  - loop through string, break when idx >= str.size - 1
  - increment count if after_P.slice(idx, 2) == right_rat

  - return count
=end
def count_deaf_rats(str)
  count = 0
  left_rat = 'O~'
  right_rat = '~O'

  str = str.delete(' ')
  index_P = str.index('P')

  before_P = str.slice(0...index_P)
  after_P = str.slice(index_P + 1..-1)

  idx = 0
  loop do
    break if idx >= str.size - 1
    count += 1 if before_P.slice(idx, 2) == left_rat
    idx += 2
  end

  idx = 0
  loop do
    break if idx >= str.size - 1
    count += 1 if after_P.slice(idx, 2) == right_rat
    idx += 2
  end

  count
end

p count_deaf_rats('~O~O~O~O P') == 0 
p count_deaf_rats('P O~ O~ ~O O~')   == 1
p count_deaf_rats('~O~O~O~OP~O~OO~') == 2