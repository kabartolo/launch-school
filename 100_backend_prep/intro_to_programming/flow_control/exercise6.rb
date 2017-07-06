def equal_to_four(x)
  if x == 4
    puts "yup"
  else
    puts "nope"
end

equal_to_four(5)

    #test_code.rb:96: syntax error, 
     # unexpected end-of-input, expecting keyword_end

# Fixed
def equal_to_four(x)
  if x == 4
    puts "yup"
  else
    puts "nope"
  end #  ==> missing the "end" in the if statement
end

equal_to_four(5)

# This error occurs because the one "end" in the program
#  is interpreted as closing the if statement and
#  we are missing another "end" to close the method.