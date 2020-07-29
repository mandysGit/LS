=begin
Problem
- Create a class called Series
- Create a public method called slices
- An instance of Series will take a String of digits
- slices method will take an Integer as argument
- slices will return a 2D array, containing all the possible consecutive number series of length n of the String of digits

slices method
Input:
- given a String of digits
- given n, an Integer
Output:
- return a 2D array of all the consecutive numbers

rules:
- Throw ArgumentError if n is greater than the length of the String of digits

Algo:
- initialize result as empty array
- Convert String of digits to Array of chars
- Convert each char to integer

- Iterate over Array of Integers with index
  - Retrieve the element from current index, up until length n. Use Array#[start, stop]
  - Append to result IF the length of the retrieved elements are equal or n
  - ELSE if less than n, break out of loop

  - return result
=end

class Series
  def initialize(digits)
    @digits = digits
  end

  def slices(n)
    raise ArgumentError if n > @digits.size

    result = []
    integers = @digits.chars.map(&:to_i)

    integers.each_with_index do |_, idx|
      conse_nums = integers[idx, n]
      result << conse_nums if conse_nums.size == n
      break if conse_nums.size < n
    end

    result
  end
end
