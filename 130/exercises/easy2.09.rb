def each_cons(arr)
  count = 0 

  while count < arr.size - 1
    yield(arr[count], arr[count+1])
    count += 1
  end

  nil
end



def each_cons(arr)
  arr.each_with_index do |item, index|
    break if index + 1 >= arr.size
    yield(item, arr[index + 1])
  end
  nil
end

hash = {}
result = each_cons([1, 3, 6, 10]) do |value1, value2|
  hash[value1] = value2
end
p result == nil
p hash == { 1 => 3, 3 => 6, 6 => 10 }

hash = {}
result = each_cons([]) do |value1, value2|
  hash[value1] = value2
end
p hash == {}
p result == nil

hash = {}
result = each_cons(['a', 'b']) do |value1, value2|
  hash[value1] = value2
end
p hash == {'a' => 'b'}
p result == nil
