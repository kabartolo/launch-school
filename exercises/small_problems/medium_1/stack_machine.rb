# Medium 1: Exercise 6: Stack Machine Interpretation (2 May 2017)

# See https://launchschool.com/exercises/0f677535 for description

OPERATIONS = { ADD: :+, SUB: :-, MULT: :*, DIV: :/, MOD: :% }

def minilang(string)
  register = 0
  stack = []

  string.split.each do |token|
    case token
    when token.to_i.to_s then register = token.to_i
    when 'PRINT'         then puts register
    when 'PUSH'          then stack.push(register)
    when 'POP'           then register = stack.pop
    else
      register = register.send(OPERATIONS[token.to_sym], stack.pop)
    end
  end
end

# Further exploration

# A Minilang program to evaluate (3 + (4 * 5) - 7) / (5 % 3) => 8
minilang('3 PUSH 5 MOD PUSH 4 PUSH 5 MULT PUSH 3 ADD PUSH 7 PUSH 0 SUB ADD DIV PRINT')
minilang('3 PUSH 5 MOD PUSH 3 PUSH 7 PUSH 4 PUSH 5 MULT SUB ADD DIV PRINT')
# Test cases

# minilang('PRINT')
# # 0

# minilang('5 PUSH 3 MULT PRINT')
# # 15

# minilang('5 PRINT PUSH 3 PRINT ADD PRINT')
# # 5
# # 3
# # 8

# minilang('5 PUSH POP PRINT')
# # 5

# minilang('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT')
# # 5
# # 10
# # 4
# # 7

# minilang('3 PUSH PUSH 7 DIV MULT PRINT ')
# # 6

# minilang('4 PUSH PUSH 7 MOD MULT PRINT ')
# # 12

# minilang('-3 PUSH 5 SUB PRINT')
# # 8

# minilang('6 PUSH')
# # (nothing printed; no PRINT commands)

