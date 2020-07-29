# Find Missing Numbers

# Problem
# Given an sorted array of Integers
# Return an array that includes the missing integers, in order

# Input: Array
# Output: Array

# Algorithm
# - Use #select to iterate over input Array
#     - On each iteration
#     - Check if `num` is NOT included in input Array
# return the return value of #select, which is the Array that contains the missing integers

def missing(arr)
  (arr[0]..arr[-1]).select do |num|
    !arr.include? num
  end
end

p missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
p missing([1, 2, 3, 4]) == []
p missing([1, 5]) == [2, 3, 4]
p missing([6]) == []
