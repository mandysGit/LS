#### Additional Practice with Methods

-----------------------------------------------------------------

1.

`flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]`
Turn into a Hash

**Basic Loop**

```ruby
counter = 0
hash = {}

loop do
  break if counter >= flintstones.size
  hash[flintstones[counter]] = counter
  counter += 1
end
```

**Using `for` keyword**

```ruby
counter = 0
hash = {}

for flintstone in flintstones
  hash[flintstone] = counter
  counter += 1
end
```

**Array#each_with_index**

```ruby
hash = {}

flintstones.each_with_index do |flintstone, index|
  hash[flintstone] = index
end
```

**While**

```ruby
hash = {}
counter = 0

while counter < flintstones.size
  hash[flintstones[counter]] = counter
  counter += 1
end
```

**Until**

```ruby
counter = 0
hash = {}

until counter >= flintstones.size
  hash[[flintstones[counter]]] = counter
  counter += 1
end
```

2.

Add up the ages.

```ruby
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
```

**Basic Loop**

```ruby
ages_keys = ages.keys
counter = 0
sum = 0

loop do
  break if counter >= ages_keys.size
  sum += ages[ages_keys[counter]].to_i
  counter += 1
end
```

**While**

```ruby
ages_keys = ages.keys
counter = 0
sum = 0

while counter < ages_keys.size
  sum += ages[ages_keys[counter]].to_i
  counter += 1
end
```

**Until**

```ruby
ages_keys = ages.keys
counter = 0
sum = 0

until counter >= ages_keys.size
  sum += ages[ages_keys[counter]].to_i
  counter += 1
end
```

**Hash#each**

```ruby
sum = 0
ages.each do |_, value|
  sum += value
end
```

**Using for keyword**

```ruby
sum = 0
for _,value in ages
  sum += value
end
```

**Enumerable#inject**

```ruby
sum = ages.values.inject(:+)
```

3.

```ruby
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
```

Remove age 100 or greater.

**Basic Loop**

```ruby
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
counter = 0
ages_keys = ages.keys

loop do
  break if counter >= ages.keys.size
    if ages[ages_keys[counter]] >= 100
      ages.delete(ages_keys[counter])
    end
  counter += 1
end
```

**Hash#select!**

```ruby
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

ages.select! {|_, value| value < 100}
p ages
```

**Hash#reject!**

```ruby
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

ages.reject! {|_, value| value >= 100}
p ages
```

**Hash#each_with_object**

```ruby
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

result = ages.each_with_object({}) do |(key, value), obj|
  if value < 100
    obj[key] = value
  end
end
p result
```

**Hash#keep_if**

```ruby
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

ages.keep_if {|_, age| age < 100}
p ages
```

4.

Pick out minium age.

**Enumerable#inject**

```ruby
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

min_age = ages.reduce(ages.first[1]) do |accumulator, (_, value)|
  accumulator < value ? accumulator : value
end

p min_age
```

**Basic Loop**

```ruby
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

counter = 0
ages_keys = ages.keys
min_age = ages[ages_keys[0]]

loop do
  break if counter >= ages_keys.size

  if ages[ages_keys[counter]] < min_age
    min_age = ages[ages_keys[counter]]
  end

  counter += 1
end

p min_age
```

**Array#min**

```ruby
ages.value.min
```

5.

Find the index of the first name that starts with "Be"

**Array#index**

```ruby
flintstones.index {|flintstone| flintstone.start_with?("Be")}
```

```ruby
flinestones.index {|name| name[0, 2] == "Be"}
```

**Basic Loop**

```ruby
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
counter = 0
result = '' 

loop do
  break if counter >= flintstones.size
  if flintstones[counter].start_with?("Be")
    result = counter
    break
  end
  counter += 1
end

p counter
```

**Array#each_with_index**

```ruby
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
result = ''

flintstones.each_with_index do |flintstone, index|
  if flintstone.start_with?("Be")
    result = index
  end
end

p result
```

6.
Names are all shortened to just the first three characters:

**Array#map**

```ruby
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones.map! {|name| name[0,3]}
```

**Basic Loop**

```ruby
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

counter = 0
new_array = []

loop do
  break if counter >= flintstones.size
  new_array << flintstones[counter][0,3]
  counter += 1
end

p new_array
```

**Using for keyword**

```ruby
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

new_array = []
for name in flintstones
  new_array << name[0,3]
end

p new_array
```

7.

Hash that expresses the frequency with which each ltter occurs in this string.

```ruby
statement = "The Flintstones Rock"

counter = 0
hash = {}
loop do
  break if counter >= statement.size
  hash[statement[counter]] = statement.count(statement[counter])
  counter += 1
end

p hash
```

8.

```ruby
numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.shift(1)
end
```

output: 

```
1
3
```

First iteration, it prints out 1. The numbers array is mutated to [2,3,4]. Second iteration, it prints out the element at index 1, which is element 3 because the array is [2,3,4]. Third iteration, it prints out the element with the index 2, and there is no element because the array is now [3,4]. The counter used by `#each` is compared against the current length of the array rather than the original length.

```ruby
numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.pop(1)
end
```

output:

```
1
2
```

**Note: In both cases we see that iterators DO NOT work on a copy of the  original array or from stale meta-data (length) about the array. They  operate on the original array in real time.**

9.

titleize method

```ruby
def titlize(str)
  arr = str.split(' ').map! {|word| word.capitalize!}
  arr.join(' ')
end
```

10.

```ruby
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

KID = 0..17
ADULT = 18..64
SENIOR = 65

munsters.each do |_, value|
  case value["age"]
  when KID
    value["age_group"] = "kid"
  when ADULT
    value["age_group"] = "adult"
  else
    value["age_group"] = "senior"
  end
end

puts munsters
```

