# Hashes: Exercise 3

to_do = { one: "do homework", two: "eat lunch", three: "walk the dog" }

to_do.each_key { |key| puts key }
to_do.each_value { |value| puts value }

to_do.each do |key, value|
  puts "#{key}: #{value}"
end

# Longer version

keys = to_do.keys
values = to_do.values

keys.each { |key| puts key }
values.each { |value| puts value }

to_do.each do |key, value|
  puts "#{key}: #{value}"
end