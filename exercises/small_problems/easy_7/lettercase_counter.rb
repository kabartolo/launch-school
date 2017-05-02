# Easy 7: Exercise 2: Lettercase Counter (18 April 2017)

# Write a method that takes a string, and then returns a hash
# that contains 3 entries: one represents the number of characters
# in the string that are lowercase letters, one the number of characters
# that are uppercase letters, and one the number of characters that are
# neither.

def letter_case_count(string)
  result = { lowercase: 0, uppercase: 0, neither: 0 }
  
  string.each_char do |c|
    case
    when ('a'..'z').include?(c) then result[:lowercase] += 1
    when ('A'..'Z').include?(c) then result[:uppercase] += 1
    else result[:neither] += 1
    end
  end

  result
end

def letter_case_count(string)
  result = {}

  chars = string.chars
  result[:lowercase] = chars.count { |c| c =~ /[a-z]/ }
  result[:uppercase] = chars.count { |c| c =~ /[A-Z]/ }
  result[:neither] = chars.count { |c| c =~ /[^a-zA-Z]/ }

  result
end

def letter_case_count(string)
  result = {}

  result[:lowercase] = string.scan(/[a-z]/).length
  result[:uppercase] = string.scan(/[A-Z]/).length
  result[:neither] = string.scan(/[^A-Za-z]/).length

  result
end

p letter_case_count('abCdef 123') #== { lowercase: 5, uppercase: 1, neither: 4 }
p letter_case_count('AbCd +Ef') #== { lowercase: 3, uppercase: 3, neither: 2 }
p letter_case_count('123') #== { lowercase: 0, uppercase: 0, neither: 3 }
p letter_case_count('') #== { lowercase: 0, uppercase: 0, neither: 0 }