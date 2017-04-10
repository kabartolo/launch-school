# Easy 4: Exercise 2: What Century is That? (6 April 2017)

# Write a method that takes a year as input and returns
# the century. The return value should be a string that
# begins with the century number, and ends with st, nd, rd, or th
# as appropriate for that number.

# New centuries begin in years that end with 01.
# So, the years 1901-2000 comprise the 20th century.

def century(year)
  suffixes = { 1 => 'st', 2 => 'nd', 3 => 'rd', 11 => 'th', 12 => 'th', 13 => 'th' }

  century = year / 100
  tens = year % 100
  century += 1 unless tens == 0

  century_last_digits = century % 100
  unless (11..13).include?(century_last_digits)
    century_last_digits = century % 10
  end
  suffix = suffixes[century_last_digits] || 'th'
  "#{century}#{suffix}"

end
puts century(2000)
puts century(2000) == '20th'
puts century(2001)
puts century(2001) == '21st'
puts century(1965)
puts century(1965) == '20th'
puts century(256)
puts century(256) == '3rd'
puts century(5)
puts century(5) == '1st'
puts century(10103)
puts century(10103) == '102nd'
puts century(1052)
puts century(1052) == '11th'
puts century(1127)
puts century(1127) == '12th'
puts century(11201)
puts century(11201) == '113th'
puts century(111201)
puts century(111201) == '1113th'
puts century(20120)
puts century(20120) == '202nd'
