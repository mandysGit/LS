=begin
1. Combine Two Lists
=====================
Input: Two Arrays
Output: One Array, contains elements from both Input Arrays

Algorithm:
- Set counter = 0
- Set result = []
- loop until counter >= Array.size
- For each iteration, insert one element from array1 and one element from array2 to the new array
=end

def interleave(arr1, arr2)
  result = []
  counter = 0

  loop do 
    break if counter >= arr1.size
    result << arr1[counter] << arr2[counter]
    counter += 1
  end

  result
end

# Further Exploration
def interleave2(arr1,  arr2)
  arr1.zip(arr2).flatten
end

# interleave2([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']

=begin
2. Lettercase Counter
=====================
Input: 
Output:

Rules:

Algorithm:
=end

=begin
3. Caitalize Words
=====================
Input: 
Output:

Rules:

Algorithm:
=end

=begin
4. Swap Case
=====================
Input: 
Output:

Rules:

Algorithm:
=end

=begin
5. Staggered Caps(Part 1)
=====================
Input: 
Output:

Rules:

Algorithm:
=end

=begin
6. Staggered Caps(Part 2)
=====================
Input: 
Output:

Rules:

Algorithm:
=end

=begin
7. Multiplicative Average
=====================
Input: 
Output:

Rules:

Algorithm:
=end

=begin
8. Multiply Lists
=====================
Input: 
Output:

Rules:

Algorithm:
=end

=begin
9. Multiply All Piars
=====================
Input: 
Output:

Rules:

Algorithm:
=end

=begin
10. The End is Near But Not Here
================================
Input: 
Output:

Rules:

Algorithm:
=end