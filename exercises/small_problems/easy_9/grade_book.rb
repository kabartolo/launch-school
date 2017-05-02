# Easy 9: Exercise 9: Grade book (20 April 2017)

# Write a method that determines the mean (average) of the
# three scores passed to it, and returns the letter value
# associated with that grade.

# 90 <= score <= 100   'A'
# 80 <= score < 90    'B'
# 70 <= score < 80    'C'
# 60 <= score < 70    'D'
# 0  <= score < 60    'F'

# Tested values are all between 0 and 100. There is no need
# to check for negative values or values greater than 100.

GRADE_TABLE = { (90..100).to_a => 'A',
                (80...90).to_a => 'B',
                (70...80).to_a => 'C',
                (60...70).to_a => 'D',
                (0...60).to_a => 'F',
              }

def get_grade(*grades)
  average = grades.reduce(:+) / grades.length
  GRADE_TABLE.each do |range, letter| 
    return letter if range.include?(average)
  end
  'A+' if average > 100
end

puts get_grade(95, 90, 93) == 'A'
puts get_grade(50, 50, 95) == 'D'
puts get_grade(100, 100, 100) == 'A'
puts get_grade(80, 80, 80) == 'B'
puts get_grade(100, 110, 120) == 'A+'