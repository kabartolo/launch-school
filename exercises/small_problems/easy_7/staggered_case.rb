# Easy 7: Exercise 5: Staggered Case (20 April 2017)

# Write a method that takes a String as an argument, and returns
# a new String that contains the original value using a staggered
# capitalization scheme in which every other character is capitalized,
# and the remaining characters are lowercase. Characters that are
# not letters should not be changed, but count as characters when
# switching between upper and lowercase.

def staggered_case(string)
  string.chars.map.with_index { |c, i| i.even? ? c.upcase : c.downcase }.join
end

p staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
p staggered_case('ALL_CAPS') == 'AlL_CaPs'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'

# Modified to allow choice of upcase/downcase for first char
def staggered_case(string, first_char = :upcase)
  if first_char == :upcase
    string.chars.map.with_index { |c, i| i.even? ? c.upcase : c.downcase }.join
  elsif first_char == :downcase
    string.chars.map.with_index { |c, i| i.even? ? c.downcase : c.upcase }.join
  end
end

# Can use #send
def staggered_case(string, first_char = :upcase)
  test = first_char == :upcase ? :even? : :odd?

  string.chars.map.with_index { |c, i| i.send(test) ? c.upcase : c.downcase }.join
end

p staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
p staggered_case('ALL_CAPS') == 'AlL_CaPs'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'
p staggered_case('ALL_CAPS', :downcase) == 'aLl_cApS'