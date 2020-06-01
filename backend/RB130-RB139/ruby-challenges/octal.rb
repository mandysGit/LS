=begin
Problem:
- Given a String, convert the numerical string from octal to decimal
- If string is invalid, return 0

Data structure:
- Input: String
- Output: Integer

Algo:
- initialize result as 0
- return result if input string contains characters not from 0-7
- initialize exp = @str.size - 1
- Iterate over input string, use string#chars
  - convert 'char' to integer, use string#to_i
  - multiply 'char' by 8^exp
  - add 'char' to result
  - decrement exp by 1

- return result
=end

class Octal
  def initialize(str)
    @str = str
  end

  def to_decimal
    result = 0
    exp = @str.size - 1
    return result if @str.match(/[^0-7]/)

    @str.each_char do |char|
      result += (char.to_i)*(8**exp)
      exp = exp - 1
    end

    p result
  end
end
