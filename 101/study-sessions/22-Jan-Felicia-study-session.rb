=begin
The time of day can be represented as the number of minutes before or after midnight.
If the number of minutes is positive, the time is after midnight.
If the number of minutes is negative, the time is before midnight.

Write a method that takes a time using this minute-based format and returns the time of day in 24 hour format (hh:mm).
Your method should work with any integer input.

You may not use ruby's Date and Time classes.

Problem:
- Given an Integer, either positive, negative, or zero
- Return a String in 24-hour format(hh:mm)

Rules:
- Number is positive, after midnight
- Number is negative, before midnight

Algo:
- initialize a constant, ONE_HOUR = 60
- initialize a constant, HOURS_IN_A_DAY = 24

- Figure how many minutes
- minutes = input integer
- hours = minutes/HOUR

- IF hours < DAY
  - return "#{hour}:#{remaining_mins}"

- ELSE hours >= DAY
  - remaining_hours = hours % HOURS_IN_A_DAY
  - remaining_mins = minutes % ONE_HOUR
  - return "#{remaining_hours}:#{remaining_mins}"

- Negative inputs
- hours, mins = input integer.divmod(MINS_IN_A_HOUR)
- IF hours > -24
  hours = 24 + (hours)
  return "#{format(hours)}:#{format(mins)}"

- ELSE hours <= -24
  hours = hours + 24 until hours >= 0
  return "#{format(hours)}:#{format(mins)}"

subprocess: format
- integer as an argument
- if the integer is 1 digit then return "0#{intger}"
- if the integer is 2 digit then return "#{intger}"
=end

# 1440 mins = 24*60 = 00:00

MINS_IN_A_HOUR = 60
HOURS_IN_A_DAY = 24

def format(int)
  if int/10 >= 1 # has 2 digits
    return "#{int}"
  else # has 1 digit
    return  "0#{int}"
  end
end


def time_of_day(int)
  hours = int / MINS_IN_A_HOUR
  mins = int % MINS_IN_A_HOUR

  if hours < 0
    if hours > -HOURS_IN_A_DAY
      hours = HOURS_IN_A_DAY + hours
      return "#{format(hours)}:#{format(mins)}"
    else
      until hours >=0
        hours += HOURS_IN_A_DAY
      end
      return "#{format(hours)}:#{format(mins)}"
    end
  end

  if hours < HOURS_IN_A_DAY
    return "#{format(hours)}:#{format(mins)}"
  else # greater or equal to a day
    remaining_hours = hours % HOURS_IN_A_DAY
    return "#{format(remaining_hours)}:#{format(mins)}"
  end
end

p time_of_day(0) == "00:00"
p time_of_day(35) == "00:35"
p time_of_day(800) == "13:20"

# greater or equal than a day
p time_of_day(3000) == "02:00"
p time_of_day(1440) == "00:00"
p time_of_day(1450) == "00:10"

p time_of_day(-3) == "23:57"

p time_of_day(-1437) == "00:03"
p time_of_day(-4231) == "01:29"
