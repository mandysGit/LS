def drop_while(arr)
  counter = 0

  loop do
    break if !yield(arr[counter]) || counter >= arr.size
    counter += 1
  end

  arr[counter..-1]
end

def drop_while(arr)
  value = nil
  arr.each do |item|
    value = item unless yield(item)
    break unless yield(item)
  end

  value ? arr[arr.index(value)..-1] : []
end

def drop_while(arr)
  index = nil
  arr.each_with_index do |item, idx|
    index = idx unless yield(item)
    break unless yield(item)
  end

  index ? arr[index..-1] : []
end

p drop_while([1, 3, 5, 6]) { |value| value.odd? } == [6]
p drop_while([1, 3, 5, 6]) { |value| value.even? } == [1, 3, 5, 6]
p drop_while([1, 3, 5, 6]) { |value| true } == []
p drop_while([1, 3, 5, 6]) { |value| false } == [1, 3, 5, 6]
p drop_while([1, 3, 5, 6]) { |value| value < 5 } == [5, 6]
p drop_while([]) { |value| true } == []
