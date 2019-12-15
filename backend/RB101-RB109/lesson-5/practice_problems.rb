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