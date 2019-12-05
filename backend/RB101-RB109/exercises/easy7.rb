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
# UPPERCASE = 'A'.ord..'Z'.ord
# LOWERCASE = 'a'.ord..'z'.ord

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
Input: String
Output: New String, with every word capitalized and all other lowercase.

Algorithm:
1. Use String#downcase on input String
2. Convert Input String to Array, String#split
3. Iterate through each word of the Array, Array#map
3. Invoke String#capitalize
4. Convert Array back to String, Array#Join(' ')
5. Return new String
=end
def word_cap(str)
  str.downcase.split.map { |word| word.capitalize }.join(' ')
end

# Further Exploration
def word_cap2(str)
  p str.downcase.split.map { |word| word[0].upcase + word[1..word.size-1] }.join(' ')
end

def word_cap3(str)
  array = str.downcase.split
  array.each { |word| word[0] = word[0].upcase }
  array.join(' ')
end

# p word_cap3('four score and seven') == 'Four Score And Seven'
# p word_cap3('the javaScript language') == 'The Javascript Language'
# p word_cap3('this is a "quoted" word') == 'This Is A "quoted" Word'

=begin
4. Swap Case
=====================
Input: String
Output: New String, all uppercase converted to lowercase and vice versa

Algorithm:
1. SET constants for uppercase and lowercase
2. Iterate through the String by using simple Loop, break out of the looper when counter is >= string.size
3. If char is lowercase, append uppercase version to new string
4. If char is uppercase, append lowercase version to new string
5. If it's neither, append char to new string
6. return new string
=end
UPPERCASE = 'A'.ord..'Z'.ord
LOWERCASE = 'a'.ord..'z'.ord

def swapcase(str)
  counter = 0
  result = ''

  loop do
    break if counter >= str.size
    if UPPERCASE.include?(str[counter].ord)
      result << str[counter].downcase
    elsif LOWERCASE.include?(str[counter].ord)
      result << str[counter].upcase
    else
      result << str[counter]
    end
    counter += 1
  end

  result
end

def swapcase2(str)
  str.chars.map {|char| UPPERCASE.include?(char.ord) ? char.downcase : char.upcase}.join
end

# p swapcase2('CamelCase') == 'cAMELcASE'
# p swapcase2('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'

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