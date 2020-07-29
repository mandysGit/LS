hash1 = {shoes: "nike", "hat" => "adidas", :hoodie => true}
hash2 = {"hat" => "adidas", :shoes => "nike", hoodie: true}

if hash1 == hash2
  puts "These hashes are the same!"
else
  puts "These hashes are not the same!"
end

# hash1 == hash2 returns TRUE
# The key values pairs are in different order, and have slightly different syntax
# The same key value pair exist in each hash, so they are both equal

p hash1