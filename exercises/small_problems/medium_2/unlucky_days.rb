# Medium 2: Exercise 7: Unlucky Days (5 May 2017)

# Write a method that returns the number of Friday the 13ths in
# the year given by an argument. You may assume that the year is 
# greater than 1752 (when the United Kingdom adopted the modern
# Gregorian Calendar) and that it will remain in use for the
# foreseeable future.

require 'date'

def friday_13th(year)
  year_range = (DateTime.new(year, 1, 13)..DateTime.new(year, 12, 13))
  year_range.count{ |date| date.day == 13 && date.friday? }
end

def friday_13th(year)
  (1..12).count { |month| Date.new(year, month, 13).friday? }
end

p friday_13th(2015) == 3
p friday_13th(1986) == 1
p friday_13th(2019) == 2