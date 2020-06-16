=begin
Luhn Algo
- double every second digit, from right to left
- IF digit is > 10, substract 9 from it
- add all the digits together
- IF total sum modulus 10 is 0, then it's valid
- otherwise invalid

Problem: 
- Given a number
- check if it's valid by Luhn's Algo
- return checksum
- return remainder using Luhn
- add a check digit to make number valid per Luhn's Algo
    - return original number plus the digit added

Methods & Algo
Initialize
    - Convert Integer to String, #to_s
    - Reverse the string
    - Convert String to Array, chars
    - Convert each element of the Array to Integer
    - Array#reverse_each through Array with index

- addends -> returns an array of digits changed
    - Map through numbers
    - On every odd index, num*2
    - If num > 10 , num - 9
    - return the reverse the numbers array

- checksum -> returns the checksum
- valid? -> returns true or false
- self.create -> returns Integer, original number plus check digit
    - Iterate over 0..9
    - Append each number to numbers input
        - Integer#to_s, String#<< '0', String#to_i
    - call `valid?` on the new number
    - when it's valid, return the new number
=end

class Luhn
  def initialize(numbers)
    @numbers = convert_to_array(numbers)
  end

  def self.create(numbers)
    '0123456789'.each_char do |check_digit|
      digits = numbers.to_s.+(check_digit).to_i
      return digits if self.new(digits).valid?
    end
  end

  def convert_to_array(integers)
    integers.to_s.reverse.chars.map(&:to_i)
  end

  def addends
    result = @numbers.map.with_index do |num, idx|
      if idx.even?
        num
      else
        n = num * 2
        n = n - 9 if n > 10
        n
      end
    end

    result.reverse
  end

  def checksum
    addends.sum
  end

  def valid?
    checksum % 10 == 0
  end
end

