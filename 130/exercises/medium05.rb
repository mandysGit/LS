items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "We've finished gathering!"
end

gather(items) do |*fruits, wheat|
  puts fruits.join(', ')
  puts wheat
end

gather(items) do |apples, *fruits, wheat|
  puts apples
  puts fruits.join(', ')
  puts wheat
end

gather(items) do |apples,*fruits|
  puts apples
  puts fruits.join(', ')
end

gather(items) do |apples, corn, cabbage, wheat|
  puts "#{apples}, #{corn}, #{cabbage}, and #{wheat}"
end
