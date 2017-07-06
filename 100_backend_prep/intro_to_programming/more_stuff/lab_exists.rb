words = ["laboratory", "experiment", "Pans Labyrinth", "elaborate", "polar bear"]

words.each do |word|
  if word.downcase.match(/lab/)
    puts word
  end
end