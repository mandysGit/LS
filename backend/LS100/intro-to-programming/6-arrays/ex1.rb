def check_num(arr, num)
  arr.each do |n|
    if n == num
      puts "#{num} is in the array."
    end
  end
end

def check_num2(arr, num)
  puts "#{num} is in the array." if arr.include?(num)
end

check_num([1, 3, 5, 7, 9, 11], 3)
check_num2([1, 3, 5, 7, 9, 11], 3)