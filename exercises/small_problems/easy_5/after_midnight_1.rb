# Easy 5: Exercise 2: After Midnight(Part 1) (10 April 2017)

# The time of day can be represented as the number of minutes
# before or after midnight. If the number of minutes is positive,
# the time is after midnight. If the number of minutes is negative,
# the time is before midnight.

# Write a method that takes a time using this minute-based format
# and returns the time of day in 24 hour format (hh:mm). Your
# method should work with any integer input.

# You may not use ruby's Date and Time classes.

MINUTES_PER_HOUR = 60
HOURS_PER_DAY = 24
SECONDS_PER_MINUTE = 60

def time_of_day(minutes_from_midnight)
  hours, minutes = minutes_from_midnight.divmod(MINUTES_PER_HOUR)
  hours %= HOURS_PER_DAY
  
  format('%02d:%02d', hours, minutes)
end

puts time_of_day(0) == "00:00"
puts time_of_day(-3) == "23:57"
puts time_of_day(35) == "00:35"
puts time_of_day(-1437) == "00:03"
puts time_of_day(3000) == "02:00"
puts time_of_day(800) == "13:20"
puts time_of_day(-4231) == "01:29"

# Further Exploration

# How would you approach this problem if you were allowed to use ruby's
# Date and Time classes? Suppose you also needed to consider the
# day of week? (Assume that delta_minutes is the number of minutes
# before or after midnight between Saturday and Sunday; in such a
# method, a delta_minutes value of -4231 would need to produce a
# return value of Thursday 01:29.)

require 'time'

def time_of_day(minutes_from_midnight)
  date = Date.today
  midnight_today = Time.new(date.year, date.month, date.day, 0, 0, 0)
  
  time_from_midnight = midnight_today + (minutes_from_midnight * SECONDS_PER_MINUTE)
  
  day = time_from_midnight.strftime("%A")
  time = format('%02d:%02d', time_from_midnight.hour, time_from_midnight.min)

  "#{day} #{time}"
end

puts time_of_day(0) == "Monday 00:00"
puts time_of_day(-3) == "Sunday 23:57"
puts time_of_day(35) == "Monday 00:35"
puts time_of_day(-1437) == "Sunday 00:03"
puts time_of_day(3000) == "Wednesday 02:00"
puts time_of_day(800) == "Monday 13:20"
puts time_of_day(-4231) == "Friday 01:29"
