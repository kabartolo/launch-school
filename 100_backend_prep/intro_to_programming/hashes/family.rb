# Hashes: Exercise 1

family = {  uncles: ["bob", "joe", "steve"],
            sisters: ["jane", "jill", "beth"],
            brothers: ["frank", "rob", "david"],
            aunts: ["mary", "sally", "susan"]

          }

close_family = family.select do |key, value| 
  key == :sisters || key == :brothers
end

family_arr = close_family.values.flatten
p family_arr

# Not as nice alternative

family_arr = []
close_family.each do |key, value|
  family_arr.push(value)
end

family_arr = family_arr.flatten
p family_arr