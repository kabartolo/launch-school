# Medium 2: Exercise 9: Bubble Sort  (9 May 2017)

# For problem description see: https://launchschool.com/exercises/2a5d5a4e

# Translation of optimized pseudocode into ruby code
def bubble_sort!(array)
  n = array.size

  loop do
    new_n = 0
    (1..n-1).each do |index|
      if array[index - 1] > array[index]
        array[index - 1], array[index] = array[index], array[index-1]
        new_n = index
      end
      n = new_n
    end

    break if new_n == 0
  end

  nil
end

# More idiomatic
def bubble_sort!(array)

end

array = [5, 3]
bubble_sort!(array)
p array == [3, 5]

array = [6, 2, 7, 1, 4]
bubble_sort!(array)
p array == [1, 2, 4, 6, 7]

array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
bubble_sort!(array)
p array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)