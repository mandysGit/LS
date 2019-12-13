=begin
1. Welcome Stranger
============================
Input: Array and Hash
Output:  String, a greeting that uses persons full name and title and occupation

Rules:
- Input Array: contain 2 or more elements that, when combined with adjoining spaces, will produce a person's name. 
-  hash will contain two keys, :title and :occupation, and the appropriate values

Algorithm:
1. Declare full_name variable and initalize it as Input Array.join(' ')
2. Declare title variable and initalize it as value of title in hash
3. Declare occupation variable and initalize it as value of occupation in hash
4. output greeting using Kernel#puts and string interpolation to include full name, title, and occupation in the string
=end

def greetings(arr, hash)
  full_name = arr.join(' ')
  title = hash[:title]
  occupation = hash[:occupation]

  puts "Hello, #{full_name}! Nice to have a #{title} #{occupation} around."
end

# greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })
# => Hello, John Q Doe! Nice to have a Master Plumber around.

=begin
2. Double Doubles
============================
Input: Integer
Output: Integer, return the Integer*2 if it's not a double number

Rules:
- double number is a number with an even number of digits whose left-side digits are exactly the same as its right-side digits
- 44, 3333, 103103, 7676 are all double numbers
- 444, 334433, and 107 are not

Algorithm:
1. Convert Input Intger to String, Integer#to_s
3. Check if length of String is even, String.size, String#even?
4. If even: check if it's a double number by comparing first and second half of the String
    - String index 0 up until (String.size/2) -1
    - String index String.size/2 until String.size
5. Return String converted to Integer if it's a double number
5. Return String converted to Integer*2 if it's non-double number
=end

def twice(num)
  string = num.to_s
  length = string.size
  return num*2 if length.odd?
  return num if string[0..(length/2)-1] == string[length/2..length]
  num*2
end

# p twice(37) == 74
# p twice(44) == 44
# p twice(334433) == 668866
# p twice(444) == 888
# p twice(107) == 214
# p twice(103103) == 103103
# p twice(3333) == 3333
# p twice(7676) == 7676
# p twice(123_456_789_123_456_789) == 123_456_789_123_456_789
# p twice(5) == 10

=begin
3. Always Return Negative
============================
Input:
Output:

Rules:

Algorithm:
=end

=begin
4. Counting Up
============================
Input:
Output:

Rules:

Algorithm:
=end

=begin
5. Uppercase Check
============================
Input:
Output:

Rules:

Algorithm:
=end

=begin
6. How long are you?s
============================
Input:
Output:

Rules:

Algorithm:
=end

=begin
7. Name Swapping
============================
Input:
Output:

Rules:

Algorithm:
=end

=begin
8. Sequence Count
============================
Input:
Output:

Rules:

Algorithm:
=end

=begin
9. Grade book
============================
Input:
Output:

Rules:

Algorithm:
=end

=begin
10. Grocery List
============================
Input:
Output:

Rules:

Algorithm:
=end
