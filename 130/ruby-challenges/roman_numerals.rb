=begin
Algo:
- Divide the integer up to its individual 1's 10's 100's
- Store the divided integers into an array
- reverse the array, 1000s should be first elements, lower elements should be last elements
- Iterate over the array, create the corresponding roman numeral for each element
- concentate all the roman numerals and return it as one string
=end

Fixnum.define_method(:to_roman) do 
  multiple = 1
  next_numeral, current_numeral = self.divmod(10)
  numerals = []

  until next_numeral == 0 && current_numeral == 0
    numerals.unshift(current_numeral * multiple)
    multiple *= 10
    next_numeral, current_numeral = next_numeral.divmod(10)
  end

  numerals.map { |num| convert_to_roman(num) }
          .join
end

def convert_to_roman(number)
  return 'CM' if number == 900
  return '' if number == 0
  digit = number.to_s[0].to_i

  case number
  when 1..9 then low, mid, hi = 'I', 'V', 'X'
  when 10..90 then low, mid, hi = 'X', 'L', 'C'
  when 100..800 then low, mid = 'C', 'D'
  else low = 'M'
  end

  case digit
  when 1..3 then low * digit
  when 4    then low + mid
  when 5..8 then mid + low*(digit-5)
  else low + hi
  end
end


