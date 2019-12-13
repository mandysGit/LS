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
Input:
Output:

Rules:

Algorithm:
=end

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
