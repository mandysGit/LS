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