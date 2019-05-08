contact_data = [["joe@email.com", "123 Main st.", "555-123-4567"],
            ["sally@email.com", "404 Not Found Dr.", "123-234-3454"]]

contacts = {"Joe Smith" => {}, "Sally Johnson" => {}}

count = 0

contacts.each_key do |key|
  contacts[key][:email] = contact_data[count][0]
  contacts[key][:address] = contact_data[count][1]
  contacts[key][:phone] = contact_data[count][2]

  count += 1
end 