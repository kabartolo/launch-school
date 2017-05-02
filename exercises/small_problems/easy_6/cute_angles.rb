# Easy 6: Exercise 1: Cute Angles (18 April 2017)

# Write a method that takes a floating point number that
# represents an angle between 0 and 360 degrees and returns
# a String that represents that angle in degrees, minutes,
# and seconds. You should use a degree symbol (˚) to represent
# degrees, a single quote (') to represent minutes, and a double
# quote (") to represent seconds. There are 60 minutes in a
# degree, and 60 seconds in a minute.

def dms(float)
  degrees = float.to_i.abs
  minutes = (float % 1) * 60
  seconds = (minutes % 1) * 60
  
  "%(#{degrees.round}°#{format('%02d', minutes)}'#{format('%02d', seconds)}\")"
end

puts dms(30)# == %(30°00'00")
puts dms(76.73)# == %(76°43'48")
puts dms(254.6)# == %(254°36'00")
puts dms(93.034773)# == %(93°02'05")
puts dms(0)# == %(0°00'00")
puts dms(360) #== %(360°00'00") || dms(360) == %(0°00'00")
puts dms(-76.73)
# Note: your results may differ slightly depending on how you round values, but should generally be within a second or two of the results shown.
