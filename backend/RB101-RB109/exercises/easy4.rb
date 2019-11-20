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

p century 2000 == '20th'
p century(2001) == '21st'
p century(1965) == '20th'
p century(256) == '3rd'
p century(5) == '1st'

p century(10103) == '102nd'
p century(1052) == '11th'
p century(1127) == '12th'
p century(11201) == '113th'

