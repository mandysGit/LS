# 1. ASCII String Value
# =====================
def ascii_value(str)
  str.chars.inject(0) do |sum, character|
    sum + character.ord
  end
end

# Further Exploration
# char.ord.chr == char

# p ascii_value('Four score') == 984
# p ascii_value('Launch School') == 1251
# p ascii_value('a') == 97
# p ascii_value('') == 0

=begin
2. After Midnight (Part 1)
==========================
input: Integer, minutes before or after midnight
        - negative means before
        - positive means after
output: String, in 24 hour format (hh:mm)

Algorithm: 
1. IF Input String is equal to zero
    return "00:00"

2. IF Input String is less than zero || Input String is grearer than zero 
    Retrieve Minutes
      1. GET the remainder of Input String (total minutes) MOD 60
          - This will give the remaining minutes, an integer between 0 - 59
      2. Format the minute string
          - If it is less than 10, prepend a zero infront
          - return minute string

    Retrieve Hours 
      1. GET the number of hours by dividing amount of minutes by 60
      2. Format hours String if it's positive
          - Between 0..9, prepend a zero
          - Between 10..23, don't prepend anything

          - If it is greater than 23, or if it is less than zero
              - convert_hours = hours MOD 24 (HOURS PER DAY)
              - This will give the remaining hours that did not divide evenly into 24. 
              - A number between 0 - 23
              - Format hours string by prepending zero if it's less than 10

3. Return "Hours:Minutes"
=end 

MINUTES_PER_HOUR = 60
HOURS_PER_DAY = 24

def minutes(int)
  minutes = int % MINUTES_PER_HOUR
  minutes < 10 ? "0#{minutes}" : "#{minutes}"
end

def hours (int)
  hours = int / MINUTES_PER_HOUR
  case hours
  when 0..9
    "0#{hours}"
  when 10..23
    "#{hours}"
  else
    converted_hours = hours % HOURS_PER_DAY
    converted_hours < 10 ? "0#{converted_hours}" : "#{converted_hours}"
  end
end

def time_of_day(int)
  return "00:00" if int == 0 
  return "#{hours(int)}:#{minutes(int)}"
end

# Further Exploration
TIME = Time.new(2019, 11, 24)
SECONDS_PER_MINUTE = 60
def time_of_day2(minutes)
  (TIME + (SECONDS_PER_MINUTE * minutes)).strftime("%A %H:%M")
end

# p time_of_day2(35) == "Sunday 00:35"
# p time_of_day2(800) == "Sunday 13:20"
# p time_of_day2(3000) == "Tuesday 02:00"
# p time_of_day2(0) == "Sunday 00:00"
# p time_of_day2(-3) == "Saturday 23:57"
# p time_of_day2(-1437) == "Saturday 00:03"
# p time_of_day2(-4231) == "Thursday 01:29"

##################################

# p time_of_day(35) == "00:35"
# p time_of_day(800) == "13:20"
# p time_of_day(3000) == "02:00"

# p time_of_day(0) == "00:00"

# p time_of_day(-3) == "23:57"
# p time_of_day(-1437) == "00:03"
# p time_of_day(-4231) == "01:29"

=begin
# 3. After Midnight (Part 2)
Input: String, HH:MM format
Output: Integer, number of minutes after or before midnight

Algorithm
---------
After Midnight
1. SET hours = (InputString[0] + Input String[1]) and convert to Integer
2. SET minutes = (InputString[3] + Input String[4]) and convert to Integer
3. IF hours is 24, return minutes
3. If hours is not 24, return hours * MINUTE_PER_HOUR + minutes

Before Midnight
Return zero if it's midnight
1. SET hours = (InputString[0] + Input String[1]) and convert to Integer
2. SET minutes = (InputString[3] + Input String[4]) and convert to Integer
3. IF hours is 24 or zero, return 23 hours and (60 - minutes)
4. Return (23 - hours) and (60 - minutes)
=end

def after_midnight(str)
  hours = (str[0] + str[1]).to_i
  minutes = (str[3] + str[4]).to_i
  return minutes if hours == 24
  return (hours * MINUTES_PER_HOUR) + minutes
end

def before_midnight(str)
  return 0 if str == '00:00' ||  str == '24:00'

  hours = (str[0] + str[1]).to_i
  minutes = (str[3] + str[4]).to_i

  if hours == 24 || hours == 0
    (MINUTES_PER_HOUR - minutes) + (23 * MINUTES_PER_HOUR) 
  else
    ((23 - hours) * MINUTES_PER_HOUR) + (MINUTES_PER_HOUR - minutes) 
  end
end

# Further Exploration
require 'time'

def after_midnight2(str)
  time = Time.parse(str)
  return time.min if time.hour == 0
  return (time.hour * MINUTES_PER_HOUR) + time.min
end

def before_midnight2(str)
  time = Time.parse(str)
  return 1440 - time.min if time.hour == 0
  return 1440 - time.min - (time.hour * time.min)
end

# p after_midnight2('00:00') == 0
# p after_midnight2('12:34') == 754
# p after_midnight2('24:00') == 0

# p before_midnight('00:00') == 0
# p before_midnight('12:34') == 686
# p before_midnight('24:00') == 0
# p before_midnight('00:59') == 1381