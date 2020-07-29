def step(start, stop, step) 
  count = 0

  start.upto(stop) do |value| 
    yield(value) if count == 0
    count += 1
    count = 0 if count == step
  end
end

p step(1, 10, 3) { |value| puts "value = #{value}" }
step(1, 15, 2) { |value| puts "value = #{value}" }
