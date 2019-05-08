def take_block(&hi)
  hi.call
end

take_block do
  puts "Block being called in the method!"
end