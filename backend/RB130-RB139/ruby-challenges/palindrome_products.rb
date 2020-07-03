=begin
Problem:
- Palindromic number reads the same both ways. Ex 9009
- Detect palindrome products in a given range

- Palindromes generate:
  - use Array#products to generate all factor pairs
  - use Array#select to select the pairs that are palindroms
  -  

=end

class Palindrome
  def initialize(product, factors)
    @product = product
    @factors = factors
  end

  def value
    @product
  end

  def factors

  end
end

class Palindromes
  def initialize(max_factor:, min_factor:)
    @max = max_factor
    @min = min_factor
  end

  def generate

  end

  def largest

  end

  def value

  end

  def factors

  end
end
