a = "hi there"
b = a
a = "not here"

puts b
# => "hi there"

# If our last line of code was a = "hi there",
# the result would still be the same: a and b in that case would 
# still point to different addresses in memory; they would just 
# happen to have the same value.

a = "hi there"
b = a
a << ", Bob" # mutates the caller

puts b
# => "hi there, Bob"

a = [1, 2, 3, 3]
b = a
c = a.uniq

p c
# => [1, 2, 3]
p a
# => [1, 2, 3, 3]
p b
# => [1, 2, 3, 3]

c = a.uniq!
p a
# => [1, 2, 3]

def test(b)
  b.map { |letter| "I like the letter: #{letter}" }
end

a = ['a', 'b', 'c']
test(a)
p a
# => ["a", "b", "c"]

# use map! to modify a
