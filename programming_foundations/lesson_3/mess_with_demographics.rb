munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

# Original mutating method

def mess_with_demographics(demo_hash)
  demo_hash.values.each do |family_member|
    family_member["age"] += 42
    family_member["gender"] = "other"
  end
end

mess_with_demographics(munsters)
puts "---Munsters hash is not safe:---\n #{munsters}"
puts

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

puts "---Assign or clone munsters to a new object inside the method.---"
# Assigning to a new object within method doesn't work
# Need to clone it
def dont_mess_with_demographics(demo_hash)
  new_hash = demo_hash
  puts "Hash parameter id: #{demo_hash.object_id}"
  puts "new_hash just points to same hash: #{new_hash.object_id}"
  cloned_hash = demo_hash.clone
  puts "cloned_hash has a new id: #{cloned_hash.object_id}"
  cloned_hash.values.each do |family_member|
    family_member["age"] += 42
    family_member["gender"] = "other"
  end
  cloned_hash
end

cloned_hash = dont_mess_with_demographics(munsters)
puts "---Munsters hash is still not safe:---\n #{munsters}"

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

puts
puts "---Reassign outside the method---"
new_hash = mess_with_demographics(munsters)
puts "---Munsters hash is not safe:---\n #{munsters}"

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

puts
puts "---Clone munsters outside the method---"
cloned_hash = munsters.clone
mess_with_demographics(cloned_hash)
puts "---Munsters hash is STILL NOT safe:---\n #{munsters}"

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

puts
puts "---SAFE method---"

def safely_mess_with_demographics(demo_hash)
  # Safe clone
  new_hash = {}
  demo_hash.keys.each do |name|
    new_hash[name] = demo_hash[name].clone
  end
  
  new_hash.values.each do |family_member|
    family_member["age"] += 42
    family_member["gender"] = "other"
  end
  new_hash
end

puts
puts "---Safely mess with demographics...---"
puts safely_mess_with_demographics(munsters)
puts "---The Munsters are finally safe---"
puts munsters

# CF: fix method

# def fix(value)
#   puts "Value id before reassignment: #{value.object_id}"
#   value = value.upcase
#   puts "Value points to new object: #{value.object_id}"
#   value.concat("!")
# end

# s = 'hello'
# puts "Starting id of s: #{s.object_id}"
# t = fix(s)
# puts "Final id of t: #{t.object_id}"

