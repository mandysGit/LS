=begin
Problem:
- Given a number, find the sum of all the multiples up to but not including that number
- Rules: default multples start at 3 and 5 unless a set of numbers was given

Data structure:
- Input: Integer for the limit, and set of Integers for multiples
- output: Integer

Algo:
- Create an array of natural numbers up to but not including limit
- loop over each of the natural numbers
- accumulate each number to an overall sum IF the number is an multiple of the set
=end

class SumOfMultiples
  def initialize(*set)
    @set = set
  end

  def self.to(limit, set=[3,5])
    (0...limit).reduce do |sum, num|
      if set.any? { |multiple| num % multiple == 0 }
        sum + num
      else
        sum
      end
    end
  end

  def to(limit)
    self.class.to(limit, @set)
  end
end
