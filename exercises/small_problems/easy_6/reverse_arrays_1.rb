# Easy 6: Exercise 4: Reversed Arrays (Part 1) (18 April 2017)

# Write a method that takes an Array as an argument, and
# reverses its elements in place; that is, mutate the Array
# passed in to this method. The return value should be the
# same Array object.

# You may not use Array#reverse or Array#reverse!.

def reverse!(list)
  list.each_index { |index| list.insert(index, list.pop) }
end

# def reverse!(list)
#   count = 0
#   copy = list.clone

#   list.map! do |num|
#     count -= 1
#     copy[count]
#   end
# end


list = [1,2,3,4]
p result = reverse!(list) # => [4,3,2,1]
puts list == [4, 3, 2, 1]
puts list.object_id == result.object_id

list = %w(a b c d e)
p reverse!(list) # => ["e", "d", "c", "b", "a"]
p list == ["e", "d", "c", "b", "a"]

list = ['abc']
p reverse!(list) # => ["abc"]
p list == ["abc"]

list = []
p reverse!([]) # => []
p list == []
