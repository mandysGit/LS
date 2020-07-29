def each_with_index(arr)
  count = 0

  while count < arr.size
    yield(arr[count], count)
    count += 1
  end

  arr
end

def each_with_index(arr)
  count = 0

  arr.each do |item|
    yield(item, count)
    count += 1
  end
end

def each_with_index(arr)
  arr.inject(0) do |count, item|
    yield(item, count)
    count + 1
  end

  arr
end

result = each_with_index([1,3,6]) do |value, index|
  puts "#{index} -> #{value**index}"
end

puts result == [1,3,6]
