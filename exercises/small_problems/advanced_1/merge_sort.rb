# Advanced 8: Merge Sort (9 May 2017)

# Sort an array of passed in values using merge sort. You can assume that
# this array may contain only one type of data. And that data may be either all
# numbers or all strings.

# Merge sort is a recursive sorting algorithm that works by breaking down the
# array elements into nested sub-arrays, then recombining those nested sub-arrays
# in sorted order. It is best shown by example. For instance, let's merge sort
# the array [9,5,7,1]. Breaking this down into nested sub-arrays, we get:

# [9, 5, 7, 1] ->
# [[9, 5], [7, 1]] ->
# [[[9], [5]], [[7], [1]]]

# We then work our way back to a flat array by merging each pair of nested sub-arrays:

# [[[9], [5]], [[7], [1]]] ->
# [[5, 9], [1, 7]] ->
# [1, 5, 7, 9]

def merge(array1, array2)
  result = []
  
  until array1.empty? || array2.empty?
    if array1.first < array2.first
      result << array1.first
      array1 = array1[1..-1]
    else
      result << array2.first
      array2 = array2[1..-1]
    end
  end

  result + array1 + array2
end

def merge_sort(array)
  return array if array.size == 1

  pair = ([] << array[0...array.size/2] << array[array.size/2..-1]).map do |sub| 
    merge_sort(sub)
  end

  merge(pair.first, pair.last)
end

# Non-recursive

def merge_sort(array)
  array = array.slice(1)
  puts array
  
end

p merge_sort([9, 5, 7, 1]) #== [1, 5, 7, 9]
merge_sort([5, 3]) == [3, 5]
# merge_sort([6, 2, 7, 1, 4]) == [1, 2, 4, 6, 7]
# merge_sort(%w(Sue Pete Alice Tyler Rachel Kim Bonnie)) == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
# merge_sort([7, 3, 9, 15, 23, 1, 6, 51, 22, 37, 54, 43, 5, 25, 35, 18, 46]) ==
# [1, 3, 5, 6, 7, 9, 15, 18, 22, 23, 25, 35, 37, 43, 46, 51, 54]
