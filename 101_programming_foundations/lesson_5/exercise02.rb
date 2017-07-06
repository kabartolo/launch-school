# 101 Lesson 5: Exercises (27 March 2017)
# Exercise 2

# How would you order this array of hashes based
# on the year of publication of each book, from the
# earliest to the latest?

books = [
  {title: 'One Hundred Years of Solitude', author: 'Gabriel Garcia Marquez', published: '1967'},
  {title: 'The Great Gatsby', author: 'F. Scott Fitzgerald', published: '1925'},
  {title: 'War and Peace', author: 'Leo Tolstoy', published: '1869'},
  {title: 'Ulysses', author: 'James Joyce', published: '1922'}
]

books_by_year = books.sort_by do |hash|
  hash[:published].to_i
end

p books_by_year

# We don't need to convert the year to integer since
# all year strings are the same length