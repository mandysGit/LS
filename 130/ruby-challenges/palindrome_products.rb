=begin
Problem:
- Palindromic number reads the same both ways. Ex 9009
- Detect palindrome products in a given range

- generate:
  - Initialize a Hash of Palindromes
    - Use Range (min..max) and Array#repeated_combination(2) to create an Array of all factors
    - Loop over all factors
      - If we multiply the pair of factors and the product is a Palindrome
      - Then add the product as key and pair as value to the Hash

  - helper method `Palindrome?`
    - Given an Integer
    - Convert it to a String and compare with the reverse String
    - num.to_s == num.to_s.reverse

- largest & smallest:
  - Create a Struct with attributes value and factors
  - value is palindromes max key
  - factors is palindromes[max.key]
=end

class Palindromes
  attr_reader :max, :min, :palindromes

  def initialize(max_factor:, min_factor: 1)
    @max = max_factor
    @min = min_factor
    @palindromes = Hash.new { |hash, key| hash[key] = [] }
  end

  def generate
    arr = *min..max
    arr.repeated_combination(2) do |x, y|
      palindromes[x * y] << [x,y] if palindrome?(x*y)
    end
  end

  def largest
    Struct.new(:value, :factors).new(palindromes.keys.max, palindromes[palindromes.keys.max])
  end
  
  def smallest
    Struct.new(:value, :factors).new(palindromes.keys.min, palindromes[palindromes.keys.min])
  end

  private

  def palindrome?(product)
    product.to_s == product.to_s.reverse
  end
end
