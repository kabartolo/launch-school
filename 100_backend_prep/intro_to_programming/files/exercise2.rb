# Files: Exercise 2 (no solution required)

d = Dir.new(".")

while file = d.read do
  puts "#{file} has extension .txt" if File.extname(file) == ".txt"
end

#    example.txt has extension .txt
#    original_file.txt has extension.txt
# => nil

# OR 

require 'pathname'
pn = Pathname.new(".")
pn.entries.each { |f| puts "#{f} has extension .txt" if f.extname == ".txt" }

#    example.txt has extension .txt
#    original_file.txt has extension.txt
# => [#<Pathname:example.txt>, #<Pathname:.>, #<Pathname:files.rb>, #<Pathname:original_file.txt>, #<Pathname:..>, #<Pathname:exercise1.rb>, #<Pathname:exercise2.rb>]
