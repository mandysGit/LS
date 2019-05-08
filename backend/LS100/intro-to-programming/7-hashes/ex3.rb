cats = {coco: 'black and white', pumpkin: 'orange'}

cats.each_key do |k|
  puts k
end

cats.each_value do |v|
  puts v
end

cats.each do |v,k|
  puts "#{v} is a #{k} cat."
end

