file = File.new("example.txt", "w+") # w+ overwrites the file
file.close #  always close the file

File.open("example.txt")

File.read("example.txt")
File.readlines("example.txt")

# r: read-only (starts at beginning of file)
# w: write-only (if the file exists, overwrites everything in the file)
# w+: read and write (if the file exists, overwrites everything in the file)
# a+: read-write (if file exists, starts at end of file. Otherwise creates a new file). Suitable for updating files.

# Writing
#  puts adds a line break to the end of strings, 
#  write does not

# using open with a block, Ruby will close the file automatically
File.open("example.txt", "w") { |file| file.write("Adding first line of text\n") }

# Otherwise
sample = File.open("example.txt", "a+")
sample.puts("Another example of writing to a file.")
sample.close
File.read("example.txt")

File.open("example.txt", "a+") do |file|
  file << "A new line of text"
end

File.readlines("example.txt").each do |line|
  puts line
end

File.open("example.txt", "a+") do |file|
  file.write "Writing to files in Ruby is simple.\n"
end

File.readlines("example.txt").each_with_index do |line, line_num|
  puts "#{line_num}: #{line}"
end

File.new("dummy_file.txt", "w+")
File.delete("dummy_file.txt") # total annihilation 

### IO Class

# irb :001 > File.superclass
# => IO
# irb :002 > $stdout
#  => #<IO:<STDOUT>>
# irb :003 > $stderr
#  => #<IO:<STDERR>>
# irb :004 > $stdin
#  => #<IO:<STDIN>>

# Dir shares some of File's methods but is not an IO stream
# Pathname exposes almost all methods of File and Dir

# irb :001 > require 'pathname'
#  => true
# irb :002 > f = File.new("example.txt", "r")
#  => #<File:example.txt>
# irb :003 > pn = Pathname.new(f)
#  => #<Pathname:example.txt>
# irb :004> pn.extname
#  => ".txt"
# irb :005 > File.extname("example.txt")
#  => ".txt"