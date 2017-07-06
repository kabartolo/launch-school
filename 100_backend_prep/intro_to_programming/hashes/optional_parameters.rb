def greeting(name, options = {})
  if options.empty?
    puts "Hi, my name is #{name}."
  else
    puts "Hi, my name is #{name} and I'm #{options[:age]}" +
        " years old and I live in #{options[:city]}."
  end
end


greeting("Bob")
greeting("Bob", {age: 62, city: "New York City"})
greeting("Kate", age: 32, city: "Taipei") 
# curly braces not required when the hash is the last argument
# !!!


