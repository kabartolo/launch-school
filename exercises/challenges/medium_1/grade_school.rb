# Challenges: Medium 1
# 23 August, 2017
# Exercise 6: Grade School

class School
  def initialize
    @data = Hash.new([])
  end

  def add(name, grade)
    @data[grade] += [name]
    @data[grade].sort!
  end

  def grade(number)
    @data[number]
  end

  def to_h
    @data.sort.to_h
  end
end