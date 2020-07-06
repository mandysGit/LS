=begin
Problem:
- Palindromic number reads the same both ways. Ex 9009
- Detect palindrome products in a given range

- generate:
  - Initialize a Hash of Palindromes
    - Use Range (min..max) and Array#product to create an Array of all factors
    - Loop over all factors
      - If we multiply the pair of factors and the product is a Palindrome
      - Then add the product as key and pair as value to the Hash

  - helper method `Palindrome?`
    - Given a Integer
    - Convert it to a String and compare with the reverse String
    - num.to_s == num.to_s.reverse

  - Each Palindromes will have `factors` and `value` as attributes
  - Sort the list of Palindromes by `value`
  - Get the largest `value` Palindrome
  - Get the factors of a Palindrome
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
    arr.product(arr) do |x, y|
      palindromes[x * y] << x*y if palindrome?(x*y)
    end
  end

  def largest

  end

  def value

  end

  def factors

  end

  private

  def palindrome?(product)
    product.to_s == product.to_s.reverse
  end
end
