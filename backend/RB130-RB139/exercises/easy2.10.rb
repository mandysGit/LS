def each_cons(arr, num)
  count = 0
  values_count = num - 1

  if num == 1
    arr.each { |item| yield(item) } if num == 1
    return
  end
  
  while count < arr.size - 1
    list = arr.slice(count + 1, values_count)
    yield(arr[count], *list) if list.size == values_count
    count += 1
  end
end

def each_cons(arr, num)
  count = 0

  while count + num - 1 < arr.size
    yield(*arr[count..(count + num - 1)])
    count += 1
  end
  nil
end

hash = {}
each_cons([1, 3, 6, 10], 1) do |value|
  hash[value] = true
end
p hash == { 1 => true, 3 => true, 6 => true, 10 => true }

hash = {}
each_cons([1, 3, 6, 10], 2) do |value1, value2|
  hash[value1] = value2
end
p hash == { 1 => 3, 3 => 6, 6 => 10 }

hash = {}
each_cons([1, 3, 6, 10], 3) do |value1, *values|
  hash[value1] = values
end
p hash == { 1 => [3, 6], 3 => [6, 10] }
p hash

hash = {}
each_cons([1, 3, 6, 10], 4) do |value1, *values|
  hash[value1] = values
end
p hash == { 1 => [3, 6, 10] }

hash = {}
each_cons([1, 3, 6, 10], 5) do |value1, *values|
  hash[value1] = values
end
p hash == {}
