produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'
}

def select_fruit(produce)
  fruits = produce.keys
  result = {}
  counter = 0

  loop do
    break if counter == produce.size
    current_fruit = fruits[counter]
    current_fruit_type = produce[current_fruit]

    if current_fruit_type == 'Fruit'
      result[current_fruit] = 'Fruit'
    end

    counter += 1
  end

  puts result
end


# select_fruit(produce)

def double_numbers!(numbers)
  counter = 0

  loop do
    break if counter == numbers.size
    numbers[counter] = numbers[counter] * 2
    counter += 1
  end

  numbers
end

# my_numbers = [1, 4, 3, 7, 2, 6]
# double_numbers!(my_numbers)

# double the numbers that have odd indices

def double_odd_indexed_numbers(my_numbers)
  double_odd_numbers = []
  counter = 0

  loop do
    break if counter == my_numbers.size

    current_number = my_numbers[counter]

    if counter.even?
      double_odd_numbers << current_number *= 2
    else
      double_odd_numbers << current_number
    end

    counter += 1
  end
  double_odd_numbers
end

def double_odd_indexed_numbers2(my_numbers)
  double_odd_numbers = []
  counter = 0

  loop do
    break if counter == my_numbers.size

    double_odd_numbers << my_numbers[counter] *= 2 if counter.even?
    double_odd_numbers << my_numbers[counter]

    counter += 1
  end

  double_odd_numbers
end

# my_numbers = [1, 4, 3, 7, 2, 6]
# p double_odd_indexed_numbers2(my_numbers)

# double numbers with transformation criteria
def double_numbers(numbers, multiplier)
  doubled_numbers = []
  counter = 0

  loop do
    break if counter == numbers.size

    current_number = numbers[counter]
    doubled_numbers << current_number * multiplier

    counter += 1
  end

  doubled_numbers
end

# my_numbers = [1, 4, 3, 7, 2, 6]
# p double_numbers(my_numbers, 5)