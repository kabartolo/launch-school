# Easy 6: Exercise 6: Combining Arrays (18 April 2017)

# Write a method that takes two Arrays as arguments, and
# returns an Array that contains all of the values from the
# argument Arrays. There should be no duplication of values
# in the returned Array, even if there are duplicates in the
# original Arrays.

def merge(array1, array2)
  (array1 + array2).uniq
end

def merge(array1, array2)
  array1 | array2 # set union
end

# Other students' solutions using the splat operator
# Interesting!

def merge(*arrs)
  [*arrs].collect_concat{ |e| e }.uniq
end

def merge(*arrs)
  arrs.flatten.uniq
end

def merge(arr1, arr2)
  [*arr1, *arr2].uniq
end

p merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]
