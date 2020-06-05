=begin
Problem:
- Given a number, find the sum of all the multiples up to but not including that number
- Rules: default multples start at 3 and 5 unless a set of numbers was given

Data structure:
- Input: Integer for the limit, and set of Integers for multiples
- output: Integer

Algo:
1) Create an array of all the multiples
- Create an array of all numbers up and including one less than limit
- IF set of numbers were given
  - create helper method `find_multiples`
  - pass in an array of number set
  - pass in the limit
  - use 1.upto(limit - 1)
  - array#each to loop over the number set
  - check each number to see if it's a multiple of the base

- IF no set of numbers given
  - use array#select to select all numbers multiple of 3 and 5

2) Sum all the multiples
=end

class SumOfMultiples
  def initialize(*nums)
    @nums = nums
  end

  def self.to(limit)
    natural_nums = (0..limit-1).to_a
    nums = @nums || [3,5]

    result = natural_nums.inject do |sum, n|
      if nums.any? { |multiple| n % multiple == 0 }
        sum + n
      else
        sum
      end
    end

    p result
  end

  def to(limit)
    natural_nums = (0..limit-1).to_a
    nums = @nums || [3,5]

    result = natural_nums.inject do |sum, n|
      if nums.any? { |multiple| n % multiple == 0 }
        sum + n
      else
        sum
      end
    end

    p result
  end
end
