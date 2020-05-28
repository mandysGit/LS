=begin
Problem: 
- Given n (limit) find all the primes from 2...n
- Use Sieve of Eratosthenes algorithm
- Iteratively mark the composites, the multiples of each prime, starting at 2

Data Structure:
- input: Integer, the limit
- output: Array of the primes from 2..n

Algo:
- Given an Integer, n, create an Array, 'nums' of all consecutive numbers from 2 up to and including n
- initialize 'primes' as empty Array

- SUBPROCESS: LOOP OVER numbers in NUMS, while 'nums' is not empty
  - initialize 'current' as first number in nums array
  - initialize 'initial' as first number in nums array

  - SUBPROCESS: remove all composites, while 'current' <= n
    - append 'current' to 'prime_nums'
    - reassign 'current' as 'current' + 'initial' to find the next composite
    - delete composites (all future occurences of current)

- return 'primes'
=end

#class Sieve
#  def initialize(n)
#    @limit = n
#  end
#
#  def primes
#    nums = (2..@limit).to_a
#    prime_nums = []
#
#    while !nums.empty?
#      initial, current = nums.first, nums.first
#
#      while current <= @limit
#        prime_nums << current if current == initial
#        nums.delete(current)
#        current = current + initial
#      end
#    end
#
#    prime_nums
#  end
#end

# Refactored

class Sieve
  def initialize(n)
    @limit = n
    @nums = (2..limit).to_a
    @prime_nums = []
  end

  def primes
    while !nums.empty?
      initial, current = nums.first, nums.first
      remove_composites(initial, current)
    end

    prime_nums
  end

  def remove_composites(initial,current)
    while current <= limit
      prime_nums << current if current == initial
      nums.delete(current)
      current = current + initial
    end
  end

  private

  attr_reader :limit, :nums, :prime_nums
end
