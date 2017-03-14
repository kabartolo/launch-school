# Hashes: Exercise 6

words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
          'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
          'flow', 'neon']

# Solution 2

collections = {}

words.each do |word|
  target = word.split('').sort.join
  if collections.include?(target)
    collections[target].push(word)
  else
    collections[target] = [word]
  end
end

collections.each_value { |value| p value }

# Original ugly solution

collections = {}

def is_anagram?(word, target)
  return word.split('').sort.join == target.split('').sort.join
end

words.each do |word|
  targets = collections.keys
  collected = collections.values
  
  if targets.empty?
    collections[word] = [word]
  elsif !targets.include?(word) && !collected.include?(word)
    match = false
    targets.each do |target|
      if is_anagram?(word, target)
        collections[target].push(word)
        match = true
        break
      end
    end
    if !match
      collections[word] = [word]
    end
  end
end

collections = collections.values
collections.each { |collection| p collection } 
