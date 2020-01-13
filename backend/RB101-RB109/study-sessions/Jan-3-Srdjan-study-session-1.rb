# Given the string of chars a..z A..Z do as in the sample cases

# p accum("abcd")    # "A-Bb-Ccc-Dddd"
# p accum("RqaEzty") # "R-Qq-Aaa-Eeee-Zzzzz-Tttttt-Yyyyyyy"
# p accum("cwAt")    # "C-Ww-Aaa-Tttt"

=begin
input: String
output: String, with each character multiplied by it's index number, joined by '-'

Algorithm:
- initialize result as empty string ''
- Use String#chars to convert input String to Array
- Iterate over array, Use Enumerable#each_with_index
- append each newchar = char*(index-1) and '-' to result
- Use String#capitalize to capitalize new_char
- if last char, remove last character, Compare char and str[-1]

return result
=end

def accum(str)
  result = ''
  str.chars.each_with_index do |char, index|
    if char == str[-1]
      new_char = char*(index+1)
    else
      new_char = char*(index+1) + '-'
    end
    result << new_char.capitalize
  end

  result
end

# Refactored version
def accum(str)
  str.chars.map.with_index do |char, index|
    (char*(index+1)).capitalize
  end.join('-')
end

p accum("abcd") == "A-Bb-Ccc-Dddd"
p accum("RqaEzty") == "R-Qq-Aaa-Eeee-Zzzzz-Tttttt-Yyyyyyy"
p accum("cwAt") == "C-Ww-Aaa-Tttt"



# You are given an array strarr of strings and an integer k. Your task is to return the first longest string consisting of k consecutive strings taken in the array.

# #Example: longest_consec(["zone", "abigail", "theta", "form", "libe", "zas", "theta", "abigail"], 2) --> "abigailtheta"

# n being the length of the string array, if n = 0 or k > n or k <= 0 return "".

=begin
input: Array of strings, and an Integer
output: String, longest string and k consecutive strings in the array

Algorithm:
- subprocess: find longest string
- Array#reduce
=end

# p longest_consec(["zone", "abigail", "theta", "form", "libe", "zas"], 2) == "abigailtheta"
# p longest_consec(["ejjjjmmtthh", "zxxuueeg", "aanlljrrrxx", "dqqqaaabbb", "oocccffuucccjjjkkkjyyyeehh"], 1) == "oocccffuucccjjjkkkjyyyeehh"
# p longest_consec([], 3) == ""
# p longest_consec(["itvayloxrp","wkppqsztdkmvcuwvereiupccauycnjutlv","vweqilsfytihvrzlaodfixoyxvyuyvgpck"], 2) == "wkppqsztdkmvcuwvereiupccauycnjutlvvweqilsfytihvrzlaodfixoyxvyuyvgpck"
# p longest_consec(["wlwsasphmxx","owiaxujylentrklctozmymu","wpgozvxxiu"], 2) == "wlwsasphmxxowiaxujylentrklctozmymu"
# p longest_consec(["zone", "abigail", "theta", "form", "libe", "zas"], -2) == ""
# p longest_consec(["it","wkppv","ixoyx", "3452", "zzzzzzzzzzzz"], 3) == "ixoyx3452zzzzzzzzzzzz"
# p longest_consec(["it","wkppv","ixoyx", "3452", "zzzzzzzzzzzz"], 15) == ""
# p longest_consec(["it","wkppv","ixoyx", "3452", "zzzzzzzzzzzz"], 0) == ""
