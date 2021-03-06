=begin
1. Cute angles
--------------
Input: Float, an angle between 0 and 360
Output: String that includes: degrees, minutes, and seconds

Rules:
- Use ° to prersent degrees
- Single ' to present minutes
- Double " to present seconds
- one degree has 60 mins
- 1 minute has 60 secs

Algorithm
1. SET result as empty string
2. SET degrees = Input Float round down to the nearest Integer value. Float#truncate
3. SET minutes
    - decimal = Input Float % degrees
    - minutes = (decimal * 60)
4. SET seconds
    - get minutes 
    - decimal = mintutes % minutes.truncate
    - seconds = decimal * 60
4. return "#{degrees°#{minutes}'#{seconds}""
=end

def get_minutes(input, degrees)
  decimals = input % degrees
  minutes = decimals * 60
end

def get_seconds(input, minutes)
  decimals = minutes % minutes.truncate
  seconds = decimals * 60
end

def dms(input)
  return %(360°00'00") if input == 360
  return %(0°00'00") if input == 0

  degrees = input.truncate
  minutes = get_minutes(input, degrees)

  return %(#{degrees}°00'00") if minutes == 0
  seconds = get_seconds(input, minutes)

  format_minutes = format("%02d", minutes.truncate)
  format_seconds = format("%02d", seconds.truncate)
  
  %(#{degrees}°#{format_minutes}'#{format_seconds}")
end

# Further Exploration
MINUTES_PER_DEGREE = 60
SECONDS_PER_MINUTE = 60
SECONDS_PER_DEGREE = MINUTES_PER_DEGREE * SECONDS_PER_MINUTE

def dms2(degrees_float)
  total_seconds = (degrees_float * SECONDS_PER_DEGREE).round
  degrees, remaining_seconds = total_seconds.divmod(SECONDS_PER_DEGREE)
  degrees = degrees % 360
  minutes, seconds = remaining_seconds.divmod(SECONDS_PER_MINUTE)
  format(%(#{degrees}°%02d'%02d"), minutes, seconds)
end

# p dms2(400) == %(40°00'00")
# p dms2(-40) == %(320°00'00")
# p dms2(-420) == %(300°00'00")

# p dms(30) == %(30°00'00")
# p dms(76.73) == %(76°43'48")
# p dms(254.6) == %(254°35'59")
# p dms(93.034773) == %(93°02'05")
# p dms(0) == %(0°00'00")
# p dms(360) == %(360°00'00") || dms(360) == %(0°00'00")


# 2 Delete vowels
# ===============

def remove_vowels(arr)
  arr.each do |str|
    str.delete!('aeiouAEIOU')
  end

  arr
end

# remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
# remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
# remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']

# 3 Fibonacci Number Location by Length
# =====================================
def fib(num)
  return num if num <= 1 

  fib(num-1) + fib(num-2)
end

def find_fibonacci_index_by_length(number_of_digits)
  count_digits = 1
  fib_input = 1

  loop do 
    count_digits = fib(fib_input).digits.length
    break if count_digits == number_of_digits
    fib_input += 1
  end

  fib_input
end

# p find_fibonacci_index_by_length(2) == 7          
# p find_fibonacci_index_by_length(3) == 12        
# p find_fibonacci_index_by_length(10) == 45
# p find_fibonacci_index_by_length(100) == 476
# p find_fibonacci_index_by_length(1000) == 4782
# p find_fibonacci_index_by_length(10000) == 47847

def find_fibonacci_index_by_length2(number_digits)
  first = 1
  second = 1
  index = 2

  loop do
    fib = first + second
    second = first
    first = fib
    index += 1
    
    break if fib.to_s.size == number_digits
  end

  index
end

# p find_fibonacci_index_by_length2(2) == 7          
# p find_fibonacci_index_by_length2(3) == 12        
# p find_fibonacci_index_by_length2(10) == 45
# p find_fibonacci_index_by_length(100) == 476
# p find_fibonacci_index_by_length(1000) == 4782
# p find_fibonacci_index_by_length(10000) == 47847

# 4 Reversed Arrays (Part 1)
# ==========================
def reverse!(list)
  list.sort! do |a, b|
    list.index(b) <=> list.index(a)
  end

  list
end

def reverse2!(list)
  counter = 0
  reverse_index = -1

  loop do
    break if counter >= list.size / 2

    list[counter], list[reverse_index] = list[reverse_index], list[counter]

    counter += 1
    reverse_index -= 1
  end

  list
end

# list = [1,2,3,4]
# result = reverse!(list)

# p result == [4, 3, 2, 1]
# p list == [4, 3, 2, 1]
# p list.object_id == result.object_id

# list = %w(a b e d c)

# p reverse!(list) == ["c", "d", "e", "b", "a"]
# p list == ["c", "d", "e", "b", "a"]

# list = ['abc']

# p reverse!(list) == ["abc"]
# p list == ["abc"]

# list = []

# p reverse!(list) == []
# p list == []

# 5 Reversed Arrays (Part 2)
# ==========================
def reverse(list)
  result = list.sort do |a, b|
    list.index(b) <=> list.index(a)
  end

  result
end

def reverse2(list)
  counter = 1
  new_array = []

  loop do
    break if counter > list.size

    new_array << list[-counter]

    counter += 1
  end

  new_array
end
 
# Further Exploration
def reverse3(list)
  list.inject([]) { |array, item| array.unshift(item) }
end

def reverse4(list)
  list.each_with_object([]) {|item, array| array.unshift(item) }
end

# p reverse4([1,2,3,4]) == [4,3,2,1]          # => true
# p reverse4(%w(a b e d c)) == %w(c d e b a)  # => true
# p reverse4(['abc']) == ['abc']              # => true
# p reverse4([]) == []                        # => true

# list = [1, 3, 2]                      # => [1, 3, 2]
# new_list = reverse4(list)              # => [2, 3, 1]
# p list.object_id != new_list.object_id  # => true
# p list == [1, 3, 2]                     # => true
# p new_list == [2, 3, 1]    

# 6 Combing Arrays
# ================
def merge(arr1, arr2)
  result = []
  counter = 0

  until counter >= arr1.size || counter >= arr2.size
    result << arr1[counter] << arr2[counter]

    if arr1[counter] == arr1[-1]
      result << arr1[counter] << arr2[counter..arr2.size]
    else
      result << arr2[counter] << arr1[counter..arr1.size]
    end

    counter += 1
  end

  result.flatten.uniq
end

merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]

=begin
7. Halvsies
===========
Input: Array
Output: 2D Array that contains first half and second half of original Array

Rules: 
- If Input Array length is odd, middle element should be placed in first half

Algorithm:
- SET half = Input Array's length divide by 2
    - When half is a decimal, round up, this will place the middle number in the first half for odd length Arrays
- SET first_half = empty array
- SET second_half = empty array
- set result = empty array

- ITERATE the Input Array, 0 until the half number
- append each element to first_half
 
- ITERATE the Input Array, half until the last number of Array
- append each element to second_half

- Append first_half and second_half to result
- Return result
=end

def halvsies(arr)
  half = (arr.size/2.0).ceil
  first_half = []
  second_half = []
  result = []
  counter = 0


  while counter < half
    first_half.push(arr[counter])
    counter += 1
  end

  counter = half

  while counter < arr.size
    second_half.push(arr[counter])
    counter += 1
  end

  result.push(first_half,second_half)
end

# p halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
# p halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
# p halvsies([5]) == [[5], []]
# p halvsies([]) == [[], []]

=begin
8. Find the Duplicate
=====================
Input: Unordered Array
Output: Integer, The value that occurs twice

Rules: 
- One value in the array occurs twice, all other values occur once

Algorithm:
- ITERATE through the Input Array
- Invoke Array#count on each element of the Array
- If Array#count returns 2, break out of the loop and return the element
=end

def find_dup(arr)
  counter = 0

  until counter >= arr.size
    if arr.count(arr[counter]) == 2
      return arr[counter]
    end
    counter += 1
  end
end

def find_dup2(arr)
  p arr.select { |item| arr.count(item) == 2 }.first
end

# p find_dup2([1, 5, 3, 1]) == 1
# p find_dup2([18,  9, 36, 96, 31, 19, 54, 75, 42, 15,
#           38, 25, 97, 92, 46, 69, 91, 59, 53, 27,
#           14, 61, 90, 81,  8, 63, 95, 99, 30, 65,
#           78, 76, 48, 16, 93, 77, 52, 49, 37, 29,
#           89, 10, 84,  1, 47, 68, 12, 33, 86, 60,
#           41, 44, 83, 35, 94, 73, 98,  3, 64, 82,
#           55, 79, 80, 21, 39, 72, 13, 50,  6, 70,
#           85, 87, 51, 17, 66, 20, 28, 26,  2, 22,
#           40, 23, 71, 62, 73, 32, 43, 24,  4, 56,
#           7,  34, 57, 74, 45, 11, 88, 67,  5, 58]) == 73

=begin
9. Does My List Include This?
=====================
Input: Array, and Search Value
Output: Boolean, true or false, whether the search value is in the array or not

Algorithm:
1. Iterate through the Input Array
2. Compare each item of the array to the search value
3. If the item and search value matches, return true
4. after iterating over the array, and there's no matches, return false
=end

def include?(array, search_value)
  array.each do |item|
    if item == search_value
      return true
    end
  end

  false
end

def include2?(array, search_value)
  array.each { |item| return true if item == search_value }
  false
end

def include3?(array, search_value)
  for item in array
    return true if item == search_value
  end
  false
end

# p include3?([1,2,3,4,5], 3) == true
# p include3?([1,2,3,4,5], 6) == false
# p include3?([], 3) == false
# p include3?([nil], nil) == true
# p include3?([], nil) == false

=begin
10. Right Triangles
=====================
Input: Postive Integer
Output: A right side triangle whose sides have n (Postiive Integer) stars

Rules: the diagonal side should have one end at the lower-left of the triangle, and the other end at the upper-right

Algorithm:
1. SET counter = Input Integer
1. SET stars_counter = 1
2. Loop until counter is zero
    - print spaces * (counter - 1) 
    - print stars * (stars_counter)
    - decrement counter
    - increment stars_counter
=end

def triangle_bottom_right(n)
  space_counter = n
  stars_counter = 1
  until space_counter <= 0 
    print ' '*(space_counter - 1)
    puts '*'*(stars_counter)

    space_counter -= 1
    stars_counter += 1
  end
end

def triangle_top_left(n)
  stars = n
  spaces = 1
  until stars <= 0 
    print '*'*(stars - 1)
    puts ' '*(spaces)

    stars -= 1
    spaces += 1
  end
end

def triangle_top_right(n)
  stars = n
  spaces = 1
  until stars <= 0 
    puts ' '*(spaces) + '*'*(stars - 1)

    stars -= 1
    spaces += 1
  end
end

def triangle_bottom_left(n)
  spaces = n
  stars = 1
  until spaces <= 0 
    puts '*'*(stars) + ' '*(spaces - 1)

    spaces -= 1
    stars += 1
  end
end

# triangle_bottom_right(9)
# puts "------"
# triangle_top_right(9)
# puts "------"
# triangle_bottom_left(9)
# puts "------"
# triangle_top_left(9)
