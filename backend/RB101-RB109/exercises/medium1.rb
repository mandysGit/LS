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
  number_of_stars = 1
  number_of_spaces = n/2
  row = 1

  until row > n
    puts " "*number_of_spaces + "*"*number_of_stars + " "*number_of_spaces

    if row <= n/2
      number_of_spaces -= 1
      number_of_stars += 2
    else # row > n/2
      number_of_spaces += 1
      number_of_stars -= 2
    end

    row += 1
  end
end

# diamond(1)
# diamond(3)
# diamond(9)

# Further Exploration
def print_middle_rows(grid, number_of_middle_spaces)
  space = ' '
  puts "*#{space*number_of_middle_spaces}*".center(grid)
end

def print_end_rows(grid)
  puts "*".center(grid)
end

def diamond2(grid)
  number_of_middle_spaces = 1

  1.upto(grid/2) do |row|
    if row == 1
      print_end_rows(grid)
    else
      print_middle_rows(grid, number_of_middle_spaces)
      number_of_middle_spaces += 2
    end
  end

  (grid/2 + 1).upto(grid) do |row|
    if row == grid
      print_end_rows(grid)
    else
      print_middle_rows(grid, number_of_middle_spaces)
      number_of_middle_spaces -= 2
    end
  end
end

# diamond2(3)
# diamond2(5)
# diamond2(9)
# diamond2(21)

=begin
6. Stack Machine Interpretation
===============================
Input: String, with commands and a value (n)
Output: String if there's a Print command, otherwise perform the command without printing anything

Rules:
- data structures:
  - stack, implement as an Array
  - register, current value, not part of the stack

- Operations that require two values:
  - pops the topmost item from stack
  - performs the operation on the topmost item from stack and the value in the register
  - result is stored back in register

- Assume all programs are correct programs, won't pop non-existene value, or contain unknown operations

commands:
--------
Update Register:
- n Place a value n in the "register". Do not modify the stack.

Display Register: 
- PRINT Print the register value

Update Stack: 
- PUSH Push the register value on to the stack. Leave the value in the register.
- POP Remove the topmost item from the stack and place in register

=========================================
- ADD Pops a value from the stack and adds it to the register value, storing the result in the register.

- SUB Pops a value from the stack and subtracts it from the register value, storing the result in the register.

- MULT Pops a value from the stack and multiplies it by the register value, storing the result in the register.

- DIV Pops a value from the stack and divides it into the register value, storing the integer result in the register.

- MOD Pops a value from the stack and divides it into the register value, storing the integer remainder of the division in the register.


Algorithm:
- initalize register = []
- initalize stack = []
- initalize operations = convert input string to Array, use String#split
- loop over commands to perform each of the subprocesses


subprocess: update_register 
- reassign register new value

subprocess: display_register
- print register

subprocess: update_stack (destructive)
- takes in one argument, command
- if PUSH, push the register value onto stack
  - get register value
  - Use Array#push to push register value to stack
- if POP, pop topmost value from stack 
  - use Array#pop to get topmost value, and reassign the value to register

subprocess: perform operation
- use case statement
- If ADD, SUB, MULT, DIV, MOD
- Pop a value from stack, and perform operation with that value and register value
- store result in register

=end

def operation_result(command, register_value, stack_value)
  case command
  when 'ADD'
    stack_value + register_value
  when 'SUB'
    register_value - stack_value  
  when 'MULT'
    stack_value * register_value
  when 'DIV'
    register_value / stack_value
  when 'MOD'
    register_value % stack_value
  end
end

def minilang(program)
  register = 0
  stack = []
  commands = program.split

  commands.each do |command|
    case command
    when /^[-+]?\d+$/
      register = command.to_i
    when 'PRINT'
      puts register
    when 'PUSH'
      stack.push(register)
    when 'POP'
      register = stack.pop
    when 'ADD', 'SUB', 'MULT', 'DIV', 'MOD'
      stack_value = stack.pop
      register_value = register
      register = operation_result(command, register_value, stack_value)
    else 
      puts 'error'
    end
  end
end

# minilang('PRINT')
# # 0

# minilang('5 PUSH 3 MULT PRINT')
# # 15

# minilang('5 PRINT PUSH 3 PRINT ADD PRINT')
# # 5
# # 3
# # 8

# minilang('5 PUSH POP PRINT')
# # 5

# minilang('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT')
# # 5
# # 10
# # 4
# # 7

# minilang('3 PUSH PUSH 7 DIV MULT PRINT ')
# # 6

# minilang('4 PUSH PUSH 7 MOD MULT PRINT ')
# 12

# minilang('-3 PUSH 5 SUB PRINT')
# # 8

# minilang('6 PUSH')
# (nothing printed; no PRINT commands)

=begin
7. Word to Digit
================
Input: String
Output: Same String, number words converted to string of digts 

Rules:
-  'zero', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine' converted to a string of digits

Algorithm:
- initialize hash constant, with keys that are word strings and values that are string digit 
- loop over each key in the hash
  - for each key value, use it as the second argument for String#sub!
  - Use String#gsub! to replace word number with string digit, the key's value

- return string
=end
HASH = {
  'zero'=> '0',
  'one'=> '1',
  'two'=> '2',
  'three'=> '3',
  'four'=> '4',
  'five'=> '5',
  'six'=> '6',
  'seven'=> '7',
  'eight'=> '8',
  'nine' => '9'
}

def word_to_digit(str)
  HASH.keys.each do |word|
    str.gsub!(/\b#{word}\b/, HASH[word])
  end

  str
end

# string = 'Please call me at five five five one two three four. Thanks.'
# puts string.object_id
# p word_to_digit(string) == 'Please call me at 5 5 5 1 2 3 4. Thanks.'


=begin
8. Fibonacci Numbers (Recursion)
===============================
Input: Integer, Fib sequence
Output: Integer, Fib number 

Rules:
F(1) = 1
F(2) = 1
F(n) = F(n - 1) + F(n - 2) where n > 2

Algorithm:
=end

def fibonacci(n)
  return 1 if n == 1
  return 1 if n == 2

  return fibonacci(n - 1) + fibonacci(n - 2)
end

# p fibonacci(1) == 1
# p fibonacci(2) == 1
# p fibonacci(3) == 2
# p fibonacci(4) == 3
# p fibonacci(5) == 5
# p fibonacci(12) == 144
# p fibonacci(20) == 6765
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