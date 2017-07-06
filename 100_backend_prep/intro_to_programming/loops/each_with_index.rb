array = ["onions", "carrots", "peppers", "peas"]

array.each_with_index do |veggies, i|
  puts "The #{veggies} are at index #{i}."
end