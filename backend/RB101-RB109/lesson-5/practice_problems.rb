# Problem 1
arr = ['10', '11', '9', '7', '8']
# p arr.sort { |a, b| b.to_i <=> a.to_i }

# Problem 2
books = [
  {title: 'One Hundred Years of Solitude', author: 'Gabriel Garcia Marquez', published: '1967'},
  {title: 'The Great Gatsby', author: 'F. Scott Fitzgerald', published: '1925'},
  {title: 'War and Peace', author: 'Leo Tolstoy', published: '1869'},
  {title: 'Ulysses', author: 'James Joyce', published: '1922'}
]

# p books.sort_by { |hash| hash[:published] }

# Problem 3
arr1 = ['a', 'b', ['c', ['d', 'e', 'f', 'g']]]
# p arr1[2][1][3]

arr2 = [{first: ['a', 'b', 'c'], second: ['d', 'e', 'f']}, {third: ['g', 'h', 'i']}]
# p arr2[1][:third][0]

arr3 = [['abc'], ['def'], {third: ['ghi']}]
# p arr3[2][:third][0][0]

hsh1 = {'a' => ['d', 'e'], 'b' => ['f', 'g'], 'c' => ['h', 'i']}
# p hsh1['b'][1]

hsh2 = {first: {'d' => 3}, second: {'e' => 2, 'f' => 1}, third: {'g' => 0}}
# p hsh2[:third].key(0)

# Problem 4
arr1 = [1, [2, 3], 4]
arr1[1][1] = 4
# p arr1

arr2 = [{a: 1}, {b: 2, c: [7, 6, 5], d: 4}, 3]
arr2[2] = 3
# p arr2

hsh1 = {first: [1, 2, [3]]}
hsh1[:first][2][0] = 4
# p hsh1

hsh2 = {['a'] => {a: ['1', :two, 3], b: 4}, 'b' => 5}
hsh2[['a']][:a][2] = 4
# p hsh2

# Problem 5
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

# total = 0

# munsters.each do |_, value|
#   total += value["age"] if value["gender"] == "male"
# end

# p total

# Problem 6
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

# munsters.each do |name, value|
#   puts "#{name} is #{value["age"]}-year-old #{value["gender"]}."
# end

# Problem 7
a = 2
b = [5, 8]
arr = [a, b]

arr[0] += 2
arr[1][0] -= a

arr #=> [4, [3,8]]
a #=> 2
b #=> [3,8]

# Problem 8
hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}

# VOWELS = /[aeiou]/

# hsh.each do |_, value|
#   value.join.chars { |char| puts char if char.match?(VOWELS)}
# end

# Problem 9
arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]

# result = arr.map do |sub_array|
#   sub_array.sort { |a, b| b <=> a}
# end

# p result

# Problem 10
result = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}].map do |hash|
  incremented_hash = {}
  hash.each do |key, value|
    incremented_hash[key] = value + 1
  end
  incremented_hash
end

# p result

# Problem 11
arr = [[2], [3, 5, 7], [9], [11, 13, 15]]

result = arr.map do |sub_array|
  sub_array.select { |num| num % 3 == 0}
end

# p result

# Problem 12
arr = [[:a, 1], ['b', 'two'], ['sea', {c: 3}], [{a: 1, b: 2, c: 3, d: 4}, 'D']]

hsh = arr.each_with_object({}) do |sub_array, hash|
  hash[sub_array[0]] = sub_array[1]
end

# p hsh

# Problem 13
arr = [[1, 6, 7], [1, 4, 9], [1, 8, 3]]

def remove_evens(arr)
  result = []

  for num in arr
    result << num if num.odd?
  end

  result
end

result = arr.sort do |a, b|
  remove_evens(a) <=> remove_evens(b)
end

# p result 

# Problem 14
hsh = {
  'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
  'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
  'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
  'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
  'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
}

result = []

hsh.each_pair do |key, value|
  if value[:type] == 'fruit'
    result << value[:colors].map { |color| color.capitalize}
  else
    result << value[:size].upcase
  end 
end

# p result

# Problem 15
arr = [{a: [1, 2, 3]}, {b: [2, 4, 6], c: [3, 6], d: [4]}, {e: [8], f: [6, 10]}]

result = arr.select do |hash|
  nums_even = true

  hash.each_pair do |_, array|
    array.each { |num| nums_even = false if num.odd? }
  end

  nums_even
end

# p result

# Problem 16
HEX_DIGITS = 'abcdef0123456789'.chars

def hex(length)
  HEX_DIGITS.sample(length).join
end

def uuid
  "#{hex(8)}-#{hex(4)}-#{hex(4)}-#{hex(4)}-#{hex(12)}"
end

# p uuid