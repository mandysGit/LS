# 1. Short Long Short
# ===================
def short_long_short(str1, str2)
  return (str1 + str2 + str1) if str1.size < str2.size
  return (str2 + str1 + str2) if str2.size < str1.size
end

# p short_long_short('abc', 'defgh') == "abcdefghabc"
# p short_long_short('abcde', 'fgh') == "fghabcdefgh"
# p short_long_short('', 'xyz') == "xyz"

=begin
2. What Century is That?
========================
input: integer, a year
output: string that begins with the century number, and ends with:
st
nd
rd
th

Rules:
- new centuries begin in years that end with 01
- 1901-2000 comprise the 20th century

algorithm:
1. Find out century number
  - If year MOD 100 does have a remainder, SET century to year/100 + 1
  - If year MOD 100 does not have a remainder, SET century to year/100
2. Append appropriate suffix to century number
  - 4 cases:
    - suffix from 1 - 10
    - suffix from 11 - 19
    - suffix from 20 - 100
    - suffix from 100 - Infinity
=end

SUFFIXES = {
  1 => 'st',
  2 => 'nd',
  3 => 'rd',
  4 => 'th',
  5 => 'th',
  6 => 'th',
  7 => 'th',
  8 => 'th',
  9 => 'th',
  10 => 'th',
  0 => 'th'
}

def century(year)
  century = (year % 100) == 0 ? year/100 : (year/100) + 1

  case century
  when 0..10
    "#{century}#{SUFFIXES[century]}"
  when 11..19
    "#{century}th"
  when 20..100 
    last_digit = century.to_s[-1].to_i
    "#{century}#{SUFFIXES[last_digit]}"
  else # >100
    last_two_digits = century % 100
    if (11..19).include?(last_two_digits)
      "#{century}th"
    else
      last_digit = century.to_s[-1].to_i
      "#{century}#{SUFFIXES[last_digit]}"
    end
  end
end

# p century 2000 == '20th'
# p century(2001) == '21st'
# p century(1965) == '20th'
# p century(256) == '3rd'
# p century(5) == '1st'

# p century(10103) == '102nd'
# p century(1052) == '11th'
# p century(1127) == '12th'
# p century(11201) == '113th'

=begin
3. Leap Years (Part 1)
========================
input: Integer, a year
output: Boolean, whether if that year is a leap year

Rules:
  - The year can be evenly divided by 4;
  - If the year can be evenly divided by 100, it is NOT a leap year, unless;
  - The year is also evenly divisible by 400. Then it is a leap year.

algorithm:
  - Is Input divisble by 4? 
    - YES
      - Is input divisible by 100?
        -YES
          - Is input divisible by 400? 
            -YES
              -Leap Year
            -NO
              -Not Leap Year
        -NO
          -Leap Year
    -NO
      -Not a Leap Year
=end

def leap_year?(year)
  if year % 400 == 0
    true
  elsif year % 100 == 0
    false
  else
    year % 4 == 0
  end
end

def leap_year2?(year)
  (year % 400 == 0) ||
  (year % 4 == 0 && year % 100 != 0)
end

# Further Exploration 
def leap_year3?(year)
  if year % 4 == 0
    if year % 100 == 0
      if year % 400 == 0
        return true
      else
        return false
      end
    else 
      return true
    end
  else
    return false
  end
end

# p leap_year?(2016) == true
# p leap_year?(2015) == false
# p leap_year?(2100) == false
# p leap_year?(2400) == true
# p leap_year?(240000) == true
# p leap_year?(240001) == false
# p leap_year?(2000) == true
# p leap_year?(1900) == false
# p leap_year?(1752) == true
# p leap_year?(1700) == false
# p leap_year?(1) == false
# p leap_year?(100) == false
# p leap_year?(400) == true

# p leap_year2?(2016) == true
# p leap_year2?(2015) == false
# p leap_year2?(2100) == false
# p leap_year2?(2400) == true
# p leap_year2?(240000) == true
# p leap_year2?(240001) == false
# p leap_year2?(2000) == true
# p leap_year2?(1900) == false
# p leap_year2?(1752) == true
# p leap_year2?(1700) == false
# p leap_year2?(1) == false
# p leap_year2?(100) == false
# p leap_year2?(400) == true

# 4. Leap Year (Part 2)
# ====================
def leap_year_part_2(year)
  if year >= 1752
    leap_year?(year)
  else
    year % 4 == 0
  end
end

# p leap_year_part_2(2016) == true
# p leap_year_part_2(2015) == false
# p leap_year_part_2(2100) == false
# p leap_year_part_2(2400) == true
# p leap_year_part_2(240000) == true
# p leap_year_part_2(240001) == false
# p leap_year_part_2(2000) == true
# p leap_year_part_2(1900) == false
# p leap_year_part_2(1752) == true
# p leap_year_part_2(1700) == true
# p leap_year_part_2(1) == false
# p leap_year_part_2(100) == true
# p leap_year_part_2(400) == true

=begin
5. Multiples of 3 and 5
=======================
input: int
output: Integer, sum of all multiples of 3 or 5, that is between 1 and input

Algorithm: 
1. Find all multiples of 3 or 5, from 1 to Input
  - Set empty Array
  loop until Input is 1
    - Input MOD 3 or Input MOD 5 == 0, add Input to Array
    - decrement Input
2. Sum up all multiples
  - Use Array#inject to sum up all intgers in array
  - Or use Array#sum 
  - return sum
=end
def multisum(num)
  array = []
  return 0 if num == 1 || num == 2

  loop do
    break if num == 1

    if num % 3 == 0 || num % 5 == 0
      array << num
    end
    num -= 1
  end

  array.sum
end

# p multisum(3) == 3
# p multisum(5) == 8
# p multisum(10) == 33
# p multisum(1000) == 234168
# p multisum(20) == 98
# p multisum(2) == 0
# p multisum(1) == 0

=begin
6. Running Totals
=======================
input: Array of Integers
output: Array of Integers, with running totals

Algorithm: 
We are doing a Transformation.
 1. Set total to zero
 2. Set total_array to empty array
 3. Loop the Input Array
      - Set total = total + current_int
      - Append total to total_array 
4. return new_array
=end

def running_total(arr)
  total = 0
  total_array = []

  for number in arr
    total = total + number
    total_array << total
  end
  total_array
end

def running_total2(arr)
  total = 0
  arr.map {|num| total += num}
end

# Further Exploration
def running_total3(arr)
  total = 0
  arr.each_with_object([]) {|value, obj| obj << total += value}
end

def running_total4(arr)
  new_array = []
  counter = 1

  while counter <= arr.size
    new_array << arr[0, counter].inject(:+)
    counter += 1
  end
  new_array
  
end

# p running_total4([2, 5, 13]) == [2, 7, 20]
# p running_total4([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
# p running_total4([3]) == [3]
# p running_total4([]) == []

=begin
7. Convert a String to a Number!
================================
input: String of digits
output: Integer, String digits coverted to Integer

Algorithm: 
1. Create a Hash mapping all String digits to their Integer equivalent
2. Set total = 0
3. Set multiple = 1
4. Set Counter = 0

3. Loop through Input String using negative indexes, starting from the last digit
    - integer = Retrieve the integer that matches the string digit in the Hash
    - Total += value*multiple
    - multiple*= 10

4. return Total

'4  3  2 1'
-4 -3 -2 -1
size = 4
=end

DECIMAL_LOOKUP = {
  '1' => 1,
  '2' => 2,
  '3' => 3,
  '4' => 4,
  '5' => 5,
  '6' => 6,
  '7' => 7,
  '8' => 8,
  '9' => 9,
  '0' => 0,
  'A' => 10,
  'B' => 11,
  'C' => 12,
  'D' => 13,
  'E' => 14,
  'F' => 15
}

def string_to_integer(str)
  total = 0
  multiple = 1
  counter = 1

  loop do
    break if counter > str.size
    integer = DECIMAL_LOOKUP[str[-counter]]
    total = total + (integer*multiple)

    multiple *= 10
    counter += 1
  end

  total
end

# Further Exploration
BASE_SIXTEEN = 16

def hexadecimal_to_integer(str)
  decimal = 0
  counter = 1
  power = 0
  str.upcase! 

  loop do
    break if counter > str.size
    integer = DECIMAL_LOOKUP[str[-counter]]
    decimal = decimal + (integer * (BASE_SIXTEEN**power))

    power += 1
    counter += 1
  end

  decimal
end

# p string_to_integer('4321') == 4321
# p string_to_integer('570') == 570

# p hexadecimal_to_integer('4D9f') == 19871
# p hexadecimal_to_integer('7DE') == 2014
# p hexadecimal_to_integer('7FFFFFFFFDA') == 8796093022170
# p hexadecimal_to_integer('0') == 0

# 8. Convert a String to
# ======================
def string_to_signed_integer(str)
  case str[0]
  when '-'
    str.delete!('-')
    string_to_integer(str) * (-1)
  else
    str.delete!('+')
    string_to_integer(str)
  end
end

# Further Exploration
def string_to_signed_integer3(str)
  new_string = string_to_integer(str.delete('-+'))
  str[0] == '-' ? -new_string : new_string
end

def string_to_signed_integer2(string)
  case string[0]
  when '-' then -string_to_integer(string[1..-1])
  when '+' then string_to_integer(string[1..-1])
  else          string_to_integer(string)
  end
end

# p string_to_signed_integer3('4321') == 4321
# p string_to_signed_integer3('-570') == -570
# p string_to_signed_integer3('+100') == 100

# 9. Convert a String to
# ======================
def integer_to_string(int)
  string = ''
  number = int

  loop do
    remainder = number % 10
    string.prepend("#{remainder}")
    number /= 10
    break if number == 0
  end 

  string
end

# p integer_to_string(4321) == '4321'
# p integer_to_string(0) == '0'
# p integer_to_string(5000) == '5000'

# 10. Convert a Signed Number to a String
# ========================================
def signed_integer_to_string(int)
  if int == 0
    integer_to_string(int)
  elsif int > 0
    "+" + integer_to_string(int)
  else
    "-" + integer_to_string(int*-1)
  end
end

# Further Exploration
def signed_integer_to_string(number)
  pos_number = number < 0 ? number*-1 : number
  str_number = integer_to_string(pos_number)

  case number <=> 0
  when -1 then "-" + str_number
  when +1 then "+" + str_number
  else         str_number
  end
end

# p signed_integer_to_string(4321) == '+4321'
# p signed_integer_to_string(-123) == '-123'
# p signed_integer_to_string(0) == '0'