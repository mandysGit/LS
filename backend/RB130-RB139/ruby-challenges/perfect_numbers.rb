=begin
Problem: 
- given a positive or negative number, return the classification: deficient, perfect, abundant

Rules: 
- Perfect: sum of factors = number
- deficient: sum of factors < number
- abundant: sum of factors > number
- Raise RuntimeError if number is negative

Data structure:
Input: Pos or Neg Integer
Output: String

Algo: 
- Find all the factors of the number
  - use array#select, loop through 1...number, select all numbers where remainder is zero
- Get the sum of the factors
  - use Enumerable#sum
- Return a classification string, if the sum is < = or > number given
=end

class PerfectNumber
  def self.classify(num)
    raise RuntimeError if num < 0
      
    factors = (1...num).select { |n| num % n == 0 } 
    
    if factors.sum < num
      'deficient'
    elsif factors.sum == num
      'perfect'
    else
      'abundant'
    end
  end
end



