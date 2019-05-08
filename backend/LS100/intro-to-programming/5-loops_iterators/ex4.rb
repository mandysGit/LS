def count_down_to_zero(num)
  return if num < 0
  puts num
  count_down_to_zero(num-1)
end

count_down_to_zero(-3)
count_down_to_zero(50)