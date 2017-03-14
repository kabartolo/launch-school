def greet(person)
  puts "Hello, " + person
end

greet("John")
# stack: 
# main -> greet -> puts -> exit and return to main
greet(1)
# stack -- stuck at greet
# main -> greet -> puts

# stack trace:
# greeting.rb:2:in `+': no implicit conversion of Fixnum into String (TypeError) 
# from greeting.rb:2:in `greet'
# from greeting.rb:8:in `<main>'


# Another example

def space_out_letters(person)
  return person.split("").join(" ")
end

def greet(person)
  return "H e l l o, " + space_out_letters(person)
end

def decorate_greeting(person)
  puts "" + greet(person) + ""
end

decorate_greeting("John")
# main -> decorate_greeting -> greet -> space_out_letters (passes result back) -> greet -> decorate_greeting -> main
decorate_greeting(1)

# H e l l o, J o h n
# greeting.rb:21:in `space_out_letters': undefined method `split' for 1:Fixnum (NoMethodError)
# from greeting.rb:24:in `greet' 
# from greeting.rb:29:in `decorate_greeting'
# from greeting.rb:33:in `<main>'