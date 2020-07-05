=begin
Problem:
- Palindromic number reads the same both ways. Ex 9009
- Detect palindrome products in a given range

- generate:
  - use Array#permutations to generate all factors (@min..@max).permutations
  - use Array#select to select the pairs that are factors of a palindrome_product
  - Create an Array Or Hash to hold all `palindrome` Struct, the value and factors
=end

class Palindromes
  def initialize(max_factor:, min_factor: 1)
    @max = max_factor
    @min = min_factor
    @palindromes = []
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
