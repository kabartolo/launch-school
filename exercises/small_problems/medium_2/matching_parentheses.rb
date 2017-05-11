# Medium 2: Exercise 4: Matching Parentheses? (4 May 2017)

# Write a method that takes a string as argument, and returns
# true if all parentheses in the string are properly balanced,
# false otherwise. To be properly balanced, parentheses must
# occur in matching '(' and ')' pairs.

def balanced?(string)
  parentheses = string.chars.select { |char| char.match(/[\(\)]/) }
  left_pars = []
  
  parentheses.each do |p|
    if p == '('
      left_pars << p
    else
      return false unless left_pars.include?('(')
      left_pars.pop
    end
  end

  true
end

def balanced?(string, char_pair)
  balance = 0
  string.each_char do |c| 
    balance += case c
               when char_pair.first then 1 
               when char_pair.last then -1
               else                      0
               end

    return false if balance.negative?
  end

  balance.zero?
end

puts balanced?('What (is) this?', ['(', ')']) == true
puts balanced?('What is) this?', ['(', ')']) == false
puts balanced?('What (is this?', ['(', ')']) == false
puts balanced?('((What) (is this))?', ['(', ')']) == true
puts balanced?('((What)) (is this))?', ['(', ')']) == false
puts balanced?('Hey!', ['(', ')']) == true
puts balanced?(')Hey!(', ['(', ')']) == false
puts balanced?('What ((is))) up(', ['(', ')']) == false
puts balanced?('[[]]', ['[', ']']) == true