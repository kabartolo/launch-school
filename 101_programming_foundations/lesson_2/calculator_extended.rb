# 101 Lesson 2 (14-15 March 2017)
# Assignment: Calculator Bonus Features
# NOTE: Did not refactor original Launch School code except
# where required by an exercise

require 'yaml'

# 4.
# My original solution was JSON but it was easier to keep my
# message variables with YAML
MESSAGES = YAML.load_file("calculator_messages.yml")

# 5.
# Added fr locale
def prompt(message, language, options = {})
  msg = get_message(message, language) % options
  Kernel.puts("=> #{msg}")
end

def get_message(message, language)
  MESSAGES[language][message]
end

# 1.
# not used in program
def valid_number?(num)
  num.to_i.to_s == num.to_s
end

# 2.
# Matches pos/neg integers, floats, and edge cases
# including -0 or 0, -00 or 00, -0. or 0. and -.0 or .0
# (these will all be converted to 0 in the program)
def number?(num)
  /^-?\d+(\.\d+)?$/.match(num) || /^-?\d*\.?\d+$/.match(num)
end

# A more sensible method (requires at least one digit before the decimal
# and at least one after if it exists)
def number?(num)
  /^-?\d+(\.\d+)?$/.match(num)

# 3.
# My original solution was adding return after each "then" but we
# want to keep the return value as a variable to return on the
# last line to prevent problems with adding more code later
def operation_to_message(operation, lang)
  message = case operation
            when '1' then get_message("add", lang)
            when '2' then get_message("subtract", lang)
            when '3' then get_message("multiply", lang)
            when '4' then get_message("divide", lang)
            end
  message
end

#---Program starts here---

lang = 'en'
prompt("ask_language", lang)
loop do
  input = Kernel.gets().chomp()
  if input == 'en' || input == 'fr'
    lang = input
    break
  else
    prompt("language_error", lang)
  end
end

prompt("welcome", lang)

name = ''
loop do
  name = Kernel.gets().chomp()

  if name.empty?()
    prompt("name_error", lang)
  else
    break
  end
end

prompt("greeting", lang, { name: name })

loop do # main loop
  number1 = ''
  loop do
    prompt("ask_first_num", lang)
    number1 = Kernel.gets().chomp()

    if number?(number1)
      break
    else
      prompt("number_error", lang)
    end
  end

  number2 = ''
  loop do
    prompt("ask_second_num", lang)
    number2 = Kernel.gets().chomp()

    if number?(number2)
      break
    else
      prompt("number_error", lang)
    end
  end

  prompt("ask_operation", lang)

  operator = ''
  loop do
    operator = Kernel.gets().chomp()

    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt("operation_error", lang)
    end
  end

  op = { operator: operation_to_message(operator, lang) }
  prompt("doing_operation", lang, op)

  result = case operator
           when '1'
             number1.to_i() + number2.to_i()
           when '2'
             number1.to_i() - number2.to_i()
           when '3'
             number1.to_i() * number2.to_i()
           when '4'
             number1.to_f() / number2.to_f()
           end

  prompt("tell_result", lang, { result: result })

  prompt("ask_go_again", lang)
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end

prompt("goodbye", lang)
