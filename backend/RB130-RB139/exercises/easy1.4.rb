=begin
Problem: 
- Write a method that takes in
- a positive Integer as argument
- Returns an Array of all the divisors of the Integer

Rules: 
- return value can be in any sequence

Data Structure: 
- Input: Integer
- Output: Array of Integers

Algo: 
- initialize an empty array, result
- Use Integer#upto to loop over all the numbers from 1 until the input Integer
  - On each iteration
  - if Input Integer % `num` == 0, append it to result
- return result
=end

def divisors(num)
  result = []
  1.upto(num) do |n|
    result << n if num % n == 0
  end

  result
end

def divsors(num)
  1.upto(num).select do |n|
    num % n == 0 
  end
end

p divisors(1) == [1]
p divisors(7) == [1, 7]
p divisors(12) == [1, 2, 3, 4, 6, 12]
p divisors(98) == [1, 2, 7, 14, 49, 98]
p divisors(99400891) == [1, 9967, 9973, 99400891]


