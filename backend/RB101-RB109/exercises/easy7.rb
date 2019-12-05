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
Input: String
Output: Hash - a count of lowercase, uppercase, or neither 

Algorithm:
- SET constant for lowercase ASCII range
- SET constant for upper case ASCII range
- SET hash with 3 keys: lowercase, uppercase, neither

1. Iterate through each characte of the Input String
2. Use String#ord to get teh ASCII value of the character
3. Compare the returned value from String#ord to the ASCII ranges defined
4. Update appropriate Hash key value pair depending on what range the character lies in
5. return hash
=end
UPPERCASE = 'A'.ord..'Z'.ord
LOWERCASE = 'a'.ord..'z'.ord

def letter_case_count(str)
  hash = { lowercase: 0, uppercase: 0, neither: 0 }

  str.chars.each do |char|
    case char.ord
    when LOWERCASE
      hash[:lowercase] += 1
    when UPPERCASE
      hash[:uppercase] += 1
    else
      hash[:neither] += 1
    end
  end

  hash
end

def letter_case_count2(str)
  str.chars.each_with_object({ lowercase: 0, uppercase: 0, neither: 0 }) do |char, hash|
    case char.ord
    when LOWERCASE
      hash[:lowercase] += 1
    when UPPERCASE
      hash[:uppercase] += 1
    else
      hash[:neither] += 1
    end
  end
end

# p letter_case_count2('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
# p letter_case_count2('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
# p letter_case_count2('123') == { lowercase: 0, uppercase: 0, neither: 3 }
# p letter_case_count2('') == { lowercase: 0, uppercase: 0, neither: 0 }

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