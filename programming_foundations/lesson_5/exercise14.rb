# 101 Lesson 5: Exercises (27 March 2017)
# Exercise 14

# Given this data structure write some code to return an array containing the
# colors of the fruits and the sizes of the vegetables. The sizes should be 
# uppercase and the colors should be capitalized.

hsh = {
  'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
  'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
  'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
  'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
  'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
}

# The return value should look like this:

[["Red", "Green"], "MEDIUM", ["Red", "Green"], ["Orange"], "LARGE"]

array = hsh.map do |_, data|
  if data[:type] == 'fruit'
    data[:colors].map{|color| color.capitalize}
  elsif data[:type] == 'vegetable'
    data[:size].upcase
  end
end

p array
# => # => [["Red", "Green"], "MEDIUM", ["Red", "Green"], ["Orange"], "LARGE"]

