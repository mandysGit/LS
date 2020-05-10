# count

def count(*args)
  count = 0
  args.each { |item| count += 1 if yield(item) }
  count
end

def count(*args)
  result = args.each_with_object([]) { |item, arr| arr << item if yield(item) }
  result.size
end

def count(*args)
  args.inject(0) do |result, item|
    if yield(item)
      result + 1
    else
      result
    end
  end
end

p count(1, 3, 6) { |value| value.odd? } == 2
p count(1, 3, 6) { |value| value.even? } == 1
p count(1, 3, 6) { |value| value > 6 } == 0
p count(1, 3, 6) { |value| true } == 3
p count() { |value| true } == 0
p count(1, 3, 6) { |value| value - 6 } == 3
