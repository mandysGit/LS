def select(array)
  new_array = []
  counter = 0

  while counter < array.size
    new_array << array[counter] if yield(array[counter])
    counter += 1
  end

  new_array
end

array = [1, 2, 3, 4, 5]

p select(array) { |num| num.odd? }
p select(array) { |num| puts num }
p select(array) { |num| num + 1 }
