# The Deaf Rats of Hamelin
# https://www.codewars.com/kata/the-deaf-rats-of-hamelin/ruby
#
# The Pied Piper has been enlisted to play his magical tune
# and coax all the rats out of town.
#
# But some of the rats are deaf and are going the wrong way!
#
# How many deaf rats are there?
#
# Legend
#
#    P  = The Pied Piper
#    O~ = Rat going left
#    ~O = Rat going right
#
# Examples:
# '~O~O~O~O P'      #== 0 (has 0 deaf rats)
# 'P O~ O~ ~O O~'   #== 1 (has 1 deaf rat)
# '~O~O~O~OP~O~OO~' #== 2 (has 2 deaf rats)

=begin
  Problem: Given a String, find how many rats are going away from P. aka. deaf rats
  Input: String
  Output: Integer
  
  Rules: 
  - ~O is valid (not deaf) if P is on the left of it
  - O~ is valid if P is on the right of it
  
  Algo:
    - initialize count = 0
    - initialize have_seen_P = false
    - initialize right_rat = '~O'
    - initialize left_rat = 'O~'
    - Use String#chars retrieve every character of the input string
    - Use Array#select to create a new array by selecting only non space characters
    
    - Iterate through the Array, ~, O, or P Use Array#each_with_index
    - element[0] + element[1], concat them and compare it with right_rat or left_rat
    - have_seen_P = true if char == 'P'
    
    - IF have_seen_P
    -  element[0] + element[1] == left_rat (if it's a left rat, do nothing)
    - ELSE
    -  element[0] + element[1] == right_rat (if it's a right rat, increment count)
    -  increment count
    
    - IF !have_seen_P
    - element[0] + element[1] == left_rat
    - ELSE increment count
=end

# def num_deaf_rats()

def count_deaf_rats(str)
  count = 0
  idx = 0
  have_seen_P = false
  right_rat = '~O'
  left_rat = 'O~'
  
  arr = str.chars.select { |char| char != ' ' }
  p arr
  loop do
    break if idx >= arr.size
    if arr[idx] != arr.last
      have_seen_P = true if arr[idx] == 'P'
      next if have_seen_P 


      if have_seen_P
        # puts arr[idx] + arr[idx + 1]
        # puts right_rat
        puts "actual: "
        puts arr[idx] + arr[idx + 1]
        puts "expected: "
        puts right_rat
        count += 1 if (arr[idx] + arr[idx + 1] == right_rat)
      else # have not seen P
        puts "actual: "
        puts arr[idx] + arr[idx + 1]
        puts "expected: "
        puts right_rat
        count += 1 if (arr[idx] + arr[idx + 1] == left_rat)
      end # second if
    end # first if
    
    
    if arr[idx] == 'P'
        idx += 1
      else
        idx += 2
      end
  end # loop
  
  p count
end

# p count_deaf_rats('~O~O~O~O P') == 0 
p count_deaf_rats('P O~ O~ ~O O~')   == 1
# p count_deaf_rats('~O~O~O~OP~O~OO~') == 2