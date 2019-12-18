=begin
1. Rotation (Part 1)
====================
Input: Array
Output: New Array, where first element is moved to the end of Array

Rules:
- Dont' use Array#rotate
- don't modify the original Array

Algorithm:
- Object#dup to create shallow copy of input Array and save it as result
- initalize first_elm as first element of result, use Array#shift
- Use Array#push to insert the first_elm in last position
=end

def rotate_array(arr)
  result = arr.dup
  first_elm = result.shift
  result << first_elm

  result
end

# Further Exploration
def rotate_string(str)
  rotate_array(str.chars).join
end

def rotate_integer(int)
  rotate_array(int.to_s.chars).join.to_i
end

# p rotate_string('hello') == 'elloh'
# p rotate_integer(1234) == 2341
# p rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
# p rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
# p rotate_array(['a']) == ['a']

# x = [1, 2, 3, 4]
# p rotate_array(x) == [2, 3, 4, 1]   # => true
# x == [1, 2, 3, 4]                 # => true

=begin
2. Rotation (Part 2)
====================
Input: Two Integers, the number, last n digits of a number
Output: Integer, the rotated number

Rules:
- rotating 1 digit results in original number
- n is always positive

Algorithm:
- Convert Input Integer to String, Use Integer#to_s, initalize it as string
- Retrieve the substring by reference, string[0...-n], initalize it as substring
- Retrieve the rest of the string by reference, string[-n..-1], initialize it as rotate_substring
- Rotate the rotate_substring, use rotate_string method
- return rotate_substring + substring
=end

def rotate_rightmost_digits(num, n)
  string = num.to_s
  substring = string[0...-n]
  rotate_substring = string[-n..-1]

  result = substring + rotate_string(rotate_substring)
  result.to_i
end

# p rotate_rightmost_digits(735291, 1) == 735291
# p rotate_rightmost_digits(735291, 2) == 735219
# p rotate_rightmost_digits(735291, 3) == 735912
# p rotate_rightmost_digits(735291, 4) == 732915
# p rotate_rightmost_digits(735291, 5) == 752913
# p rotate_rightmost_digits(735291, 6) == 352917

=begin
3. Rotation (Part 3)
====================
Input: An Integer
Output: An Integer, maxium rotated Integer

Rules:
- Maximum rotation means every substring from the right has it's rightmost digit rotated

Algorithm:
- initalize result = input integer converted to string, Use Integer#to_s
- initalize counter = 1

- loop until counter is equal or greater than string.size - 1
  - initalize left_digits = result[0...counter]
  - initalize right_digits = result[counter..-1]
  - rotated_right_digits = rotate_string(right_digits)
  - result = left_digits + rotated_right_digits
  - increment counter

= return result.to_i
=end

def max_rotation(num)
  result = num.to_s
  counter = 0

  until counter >= num.to_s.size - 1
    left_digits = result[0...counter]
    right_digits = result[counter..-1]
    rotated_right_digits = rotate_string(right_digits)
    result = left_digits + rotated_right_digits
    counter += 1
  end

  result.to_i
end

# p max_rotation(735291) == 321579
# p max_rotation(3) == 3
# p max_rotation(35) == 53
# p max_rotation(105) == 15 # the leading zero gets dropped
# p max_rotation(8_703_529_146) == 7_321_609_845

=begin
4. 1000 Lights
==============
Input: Integer, the total number of switches
Output: Array, identifies which lights are on after n repetitions

Rules:
- each switch is conneted to one light
- initally, all lights are off
- on the first round (1), toggle all the switches, turns all lights on
- on other rounds, toggle the switches based on the round number
    - each switch that is toggle, is a multiple of the round number
    - each next switch is the round number plus the current switch position
    - Ex. if it's round 2, then 2,4,6,8, etc switches are toggled

Algorithm:
- initalize a hash that contain the switch number as the key and true or false as value
- Use Integer#upto to initalize the hash, 1 up to n, setting each key's value as false

Subprocess: toggling the switches
- Use Integer#upto to iterate n times
- initalize round_number, to keep track of which round
- initalize toggle_switch = round_number
- Iterate through the lights_hash, use Hash#each
    - If toggle_switch matches switch number:
      - toggle switch by reassigning value, hash[key] = !value
      - change toggle_switch += round_number

Subprocess: append all on switches to array
- Use Hash#each to loop through lights
- if lights[switch] == true, append switch to results

- return results
=end

def toggle_lights(n)
  lights = {}
  result = []

  # Initalize hash by turning all switches off
  1.upto(n) { |switch| lights[switch] = false }

  # Toggle switches for each round
  1.upto(n) do |round_number|
    toggle_switch = round_number

    lights.each_pair do |switch, state|
      if switch == toggle_switch
        lights[switch] = !state
        toggle_switch += round_number
      end
    end
  end

  # Create array with switches that are on
  lights.each_pair do |switch, state|
    result << switch if state == true
  end

  result
end

# p toggle_lights(1000) == [1, 4, 9, 16, 25, 36, 49, 64, 81, 100, 121, 144, 169, 196, 225, 256, 289, 324, 361, 400, 441, 484, 529, 576, 625, 676, 729, 784, 841, 900, 961]
# p toggle_lights(5) == [1, 4]
# p toggle_lights(10) == [1, 4, 9]

=begin
5. Diamonds!
============
Input: Integer, assume it's always odd
Output: String, 4 pointed diamond

Algorithm:
- initalize stars = 1
- initalize spaces = n/2
- initalize row = 1

- loop, break when rows is greater than n
    - puts spaces + stars + spaces

    IF row <= n/2
    - decrement spaces by 1
    - increment stars by 2

    IF row > n/2
    - increment spaces by 1
    - decrement stars by 2

    - increment row by 1
=end

def diamond(n)
  stars = 1
  spaces = n/2
  row = 1

  until row > n
    puts " "*spaces + "*"*stars + " "*spaces

    if row <= (n/2)
      spaces -= 1
      stars += 2
    else
      spaces += 1
      stars -= 2
    end

    row += 1
  end
end

# diamond(1)
# diamond(3)
# diamond(9)

=begin
6. Stack Machine Interpretation
===============================
Input:
Output:

Rules:

Algorithm:
=end

=begin
7. Word to Digit
================
Input:
Output:

Rules:

Algorithm:
=end

=begin
8. Fibonacci Numbers (Recursion)
===============================
Input:
Output:

Rules:

Algorithm:
=end

=begin
9. Fibonacci Numbers (Procedural)
=================================
Input:
Output:

Rules:

Algorithm:
=end

=begin
10. Fibonacci Numbers (Last Digit)
==================================
Input:
Output:

Rules:

Algorithm:
=end