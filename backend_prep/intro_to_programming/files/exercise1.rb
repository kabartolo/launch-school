# Files: Exercise 1 (no solution required)

example = File.read("example.txt")
original = File.new("original_file.txt", "w+")

File.open(original, "a") do |file|
  file.puts example
end

# => nil

File.read(original) # contents of example written to original

# => "Adding first line of text\nAnother example..."