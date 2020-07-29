=begin
Problem: 
- Given an Integer or String
- Convert the Integer to Binary
- Depending on which Binary number is a 1, append the correct string to an Array
- Return an Array with String words

Rules:
- Binary number is read from right to left, right most position is starting position
1 = wink
10 = double blink
100 = close your eyes
1000 = jump
10000 = Reverse the order of the operations in the secret handshake

- String may be input
- Invalid Binary string, then return empty array

Data Structure
input: Integer or String
output: Array of string words

Algo: 
- Convert Integer to binary string, use Integer#to_s(2)
- Validate Integer < 31
- Validate if String is a correct Binary sequence
  - Need to be length 5
  - Only contain 0 and 1
  - /[^01]/ regex
- Initialize secret_words as [reverse, jump, close your eyes, double blink, wink]

- Reverse the binary
- Array#Select through secret_words
  - Return secret_words[index] if the binary.reverse[idx] is 1

- If the last word is 'reverse'
  - remove reverse word, and reverse the array

- Remove all the '' from the binary array
- Return the binary array
=end

class SecretHandshake
  def initialize(number)
    @binary = validate(number) 
    @secret_words = ['wink', 'double blink', 'close your eyes', 'jump', 'reverse']
  end

  def validate(number)
    if number.instance_of?(Integer)
      return '0' if number > 31
      return number.to_s(2)
    else
      return '0' if number.size > 5 || number.match(/[^01]/)
      return number
    end
  end

  def commands
    secret = @secret_words.select.with_index do |word, idx|
      @binary.reverse[idx] == '1'
    end

    secret.reverse! if secret.delete('reverse')
    secret
  end
end
      
