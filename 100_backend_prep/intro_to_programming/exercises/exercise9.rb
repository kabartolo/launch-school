# Exercise 9

h = {a:1, b:2, c:3, d:4}
p h

# Solution 1

value_at_b = h[:b]
p value_at_b

# Solution 2

h[:e] = 5
p h

# Solution 3

h.each { |key, value| h.delete(key) if value < 3.5 }
p h

# delete_if version

h.delete_if { |key, value| value < 3.5 }