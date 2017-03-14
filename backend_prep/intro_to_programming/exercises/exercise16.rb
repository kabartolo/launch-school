a = ['white snow', 'winter wonderland', 'melting ice',
     'slippery sidewalk', 'salted roads', 'white trees']

one_word_strings = a.map { |words| words.split(" ") }.flatten
p one_word_strings

# don't need the (" ")

p a.map { |words| words.split }.flatten