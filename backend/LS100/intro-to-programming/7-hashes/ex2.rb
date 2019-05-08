name_and_age = {alice: '20', bob: '25'}
cats_and_colors = {coco: 'black and white', pumpkin: 'orange'}

merged_hash = name_and_age.merge(cats_and_colors)

p merged_hash
p name_and_age
p cats_and_colors

puts "before destructive merge"
p name_and_age

name_and_age.merge!(cats_and_colors)

puts "after destructive merge"
p name_and_age