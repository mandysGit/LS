##################### 1.
def repeat(str, num)
  counter = num
  loop do
    break if counter == 0
    puts str
    counter = counter - 1
  end
end

###################### 2.
def is_odd?(num)
  if num % 2 == 0
    false
  else
    true
  end
end

def odd?(num)
  num.remainder(2) == 1 || num.remainder(2) == -1
end

###################### 3. 
def digit_list(num)
  num.to_s.split('').map(&:to_i)
end

# puts digit_list(12345) == [1, 2, 3, 4, 5]     # => true
# puts digit_list(7) == [7]                     # => true
# puts digit_list(375290) == [3, 7, 5, 2, 9, 0] # => true
# puts digit_list(444) == [4, 4, 4]             # => true

###################### 4.
def count_occurrences(arr)
  occurences = {}
  array_keys = arr.uniq

  # create hash with number of occurrences
  array_keys.each do |element1|
    count = 0
    arr.each do |element2|
      if element1.downcase == element2.downcase
        count += 1
      end
    end
    occurences[element1] = count
  end

  # print out the value
  occurences.each do |key, value|
    puts "#{key} => #{value}"
  end 
end

# vehicles = [
#   'car', 'car', 'truck', 'car', 'SUV', 'truck',
#   'motorcycle', 'motorcycle', 'car', 'truck'
# ]
# vehicles2 = []
# vehicles3 = ['SUV', 'suv']

# count_occurrences(vehicles)
# count_occurrences(vehicles2)
# count_occurrences(vehicles3)

###################### 5.
def reverse_sentence(str)
  return '' if str == ''

  array = str.split.reverse!
  new_string = ''

  array.each do |word|
    new_string << word << ' '
  end 

  new_string.chop!
end

# puts reverse_sentence('') == ''
# puts reverse_sentence('Hello World') == 'World Hello'
# puts reverse_sentence('Reverse these words') == 'words these Reverse'

###################### 6. 
def reverse_words(words)
  reversed_all_words = ''
  array = words.split

  array.each_with_index do |word, index|
    # word is greater than 5 characters, reverse
    if word.length >= 5
      if (index == array.length - 1)
        reversed_all_words << reverse_word(word)
      else 
        reversed_all_words << reverse_word(word) << ' '
      end
    # word is less than 5 chacters, do not reverse
    else 
      if (index == array.length - 1)
        reversed_all_words << word 
      else 
        reversed_all_words << word << ' '
      end
    end
  end 

  reversed_all_words
end

def reverse_word(word)
  result = ''
  index = word.length - 1
  
  while index >= 0
    result << word[index]
    index = index - 1
  end 

  result
end 

# p reverse_words('Professional')        
# p reverse_words('Walk around the block') 
# p reverse_words('Launch School') 

###################### 7. Stringy Strings
def stringy(int, start=1)
  return '' if int == 0
  
  result = ''

  while result.length != int
    if start == 1
      result.length.odd? ? result << '0' : result << '1'
    else
      result.length.odd? ? result << '1' : result << '0'
    end 
  end

  result
end

# puts stringy(6,0) == '101010'
# puts stringy(9,0) == '101010101'
# puts stringy(4,0) == '1010'
# puts stringy(7,0) == '1010101'

# 8. Array Average
#==========================================
def average(arr)
  sum = arr.reduce {|result, current| result += current}
  sum/arr.length
end

def average_float(arr)
  sum = arr.reduce {|result, current| result += current}
  (sum.to_f/arr.length.to_f)
end

# puts average([1, 5, 87, 45, 8, 8]) == 25
# puts average([9, 47, 23, 95, 16, 52]) == 40


## 9. Sum of Digits
#==========================================
def sum(int)
  string = int.to_s
  index = string.length - 1
  result = 0

  while index >= 0
    result += string[index].to_i
    index -= 1
  end
  
  result
end 

# without using while loop
def sum2(int)
  int.to_s.chars.map(&:to_i).reduce(:+)
end

# puts sum(23) == 5
# puts sum(496) == 19
# puts sum(123_456_789) == 45

# puts sum2(23) == 5
# puts sum2(496) == 19
# puts sum2(123_456_789) == 45


# 10. What's my Bonus? 
#==========================================
def calculate_bonus(salary, give_bonus)
  if give_bonus
    return salary/2
  else
    return 0
  end
end

def calculate_bonus2(salary, give_bonus)
  give_bonus ? (salary/2) : 0
end

# puts calculate_bonus(2800, true) == 1400
# puts calculate_bonus(1000, false) == 0
# puts calculate_bonus(50000, true) == 25000