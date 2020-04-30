def reduce(array, acc=array[0])
  counter = 0

  while counter < array.size
    current_element = array[counter]

    acc = yield(acc, current_element)
    counter += 1
  end

  acc
end

array = [1, 2, 3, 4, 5]

# p reduce(array) { |acc, num| acc + num }                    # => 15
# p reduce(array, 10) { |acc, num| acc + num }                # => 25
#reduce(array) { |acc, num| acc + num if num.odd? }

p reduce(['a', 'b', 'c']) { |acc, value| acc += value }     # => 'abc'
p reduce([[1, 2], ['a', 'b']]) { |acc, value| acc + value } # => [1, 2, 'a', 'b']
