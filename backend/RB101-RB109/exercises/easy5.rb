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

=end 
def time_of_day(int)
end

p time_of_day(0) == "00:00"
p time_of_day(-3) == "23:57"
p time_of_day(35) == "00:35"
p time_of_day(-1437) == "00:03"
p time_of_day(3000) == "02:00"
p time_of_day(800) == "13:20"
p time_of_day(-4231) == "01:29"
