
arr = ['snow', 'winter', 'ice', 'slippery', 'salted roads', 'white trees']

p arr 

arr.delete_if {|word| word.start_with?('s','w')}

p arr
