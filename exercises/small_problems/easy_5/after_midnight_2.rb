# Easy 5: Exercise 3: After Midnight(Part 2) (10 April 2017)

# As seen in the previous exercise, the time of day can be
# represented as the number of minutes before or after midnight.
# If the number of minutes is positive, the time is after midnight.
# If the number of minutes is negative, the time is before midnight.

# Write two methods that each take a time of day in 24 hour
# format, and return the number of minutes before and after
# midnight, respectively. Both methods should return a value
# in the range 0..1439.

# You may not use ruby's Date and Time methods.
MINUTES_PER_HOUR = 60
HOURS_PER_DAY = 24
MINUTES_PER_DAY = MINUTES_PER_HOUR * HOURS_PER_DAY

def after_midnight(time_string)
  hours, minutes = get_hours_minutes(time_string)
  (hours * MINUTES_PER_HOUR + minutes) % MINUTES_PER_DAY
end

def before_midnight(time_string)
  result = MINUTES_PER_DAY - after_midnight(time_string)
  result == MINUTES_PER_DAY ? 0 : result
end

def get_hours_minutes(time_string)
  time_string.scan(/\d{2}/).map(&:to_i)
  # Alternative: time_str.split(':').map(&:to_i)
end

puts after_midnight('00:00') == 0
puts before_midnight('00:00') == 0
puts after_midnight('12:34') == 754
puts before_midnight('12:34') == 686
puts after_midnight('24:00') == 0
puts before_midnight('24:00') == 0

# How would these methods change if you were allowed
# to use the Date and Time classes?

require 'date'

def after_midnight(time_string)
  hours, minutes = get_hours_minutes(time_string)
  date = Date.today
  time = Time.new(date.year, date.month, date.day, hours, minutes, 0)
  
  time.hour * MINUTES_PER_HOUR + time.min
end

puts after_midnight('00:00') == 0
puts before_midnight('00:00') == 0
puts after_midnight('12:34') == 754
puts before_midnight('12:34') == 686
puts after_midnight('24:00') == 0
puts before_midnight('24:00') == 0
