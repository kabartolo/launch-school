# Exercises: 120 Object-Oriented Programming: Medium 1
# 16 June 2017
# Exercise 5

# Stack Machine Interpretation

# This is one of the hardest exercises in this exercise set. It uses both exceptions and Object#send, neither of which we've discussed in detail before now. Think of this exercise as one that pushes you to learn new things on your own, and don't worry if you can't solve it.

# You may remember our Minilang language from back in the 101 Medium exercises. We return to that language now, but this time we'll be using OOP. If you need a refresher, refer back to that exercise.

# Write a class that implements a miniature stack-and-register-based programming language that has the following commands:

#     n Place a value n in the "register". Do not modify the stack.
#     PUSH Push the register value on to the stack. Leave the value in the register.
#     ADD Pops a value from the stack and adds it to the register value, storing the result in the register.
#     SUB Pops a value from the stack and subtracts it from the register value, storing the result in the register.
#     MULT Pops a value from the stack and multiplies it by the register value, storing the result in the register.
#     DIV Pops a value from the stack and divides it into the register value, storing the integer result in the register.
#     MOD Pops a value from the stack and divides it into the register value, storing the integer remainder of the division in the register.
#     POP Remove the topmost item from the stack and place in register
#     PRINT Print the register value

# All operations are integer operations (which is only important with DIV and MOD).

# Programs will be supplied to your language method via a string passed in as an argument. Your program should produce an error if an unexpected item is present in the string, or if a required stack value is not on the stack when it should be (the stack is empty). In all error cases, no further processing should be performed on the program.

# You should initialize the register to 0.


# Solution: Should be refactored but it works.

class Minilang
	OPERATIONS = ['ADD', 'SUB', 'MULT', 'DIV', 'MOD', 'PUSH', 'POP', 'PRINT']
	
	def initialize(string)
		@tokens = init_tokens(string)
		@register = 0
		@stack = []
	end

	def eval
		@tokens.each do |element|
			return puts @error if @error

			if integer?(element)
				set_register(element)
			else
				send(element.downcase)
			end
		end
	end

	private
	
	def init_tokens(string)
		result = string.split
		@error = error(result)
		
		result
	end

	def error(words)
		unless words.include?('PRINT')
			return "(nothing printed; no PRINT commands)"
		end

		words.each do |word|
			unless OPERATIONS.include?(word) || integer?(word)
				return "Invalid token: #{word}"
			end
		end

		nil
	end

	def integer?(string)
		string =~ /^[-+]?[0-9]*$/
  end

	def set_register(n)
		@register = n.to_i
	end

	def push
		@stack << @register
	end

	def pop
		return @error = "Empty stack!" if @stack.empty?
		@register = @stack.pop
	end

	def add
		@register = @register + @stack.pop
	end

	def sub
		@register = @register - @stack.pop
	end

	def mult 
		@register = @register * @stack.pop
	end

	def div
		@register = @register / @stack.pop
	end

	def mod
		@register = @register % @stack.pop
	end

	def print
		puts @register
	end
end

# Examples:

Minilang.new('PRINT').eval
# 0

Minilang.new('5 PUSH 3 MULT PRINT').eval
# 15

Minilang.new('5 PRINT PUSH 3 PRINT ADD PRINT').eval
# 5
# 3
# 8

Minilang.new('5 PUSH 10 PRINT POP PRINT').eval
# 10
# 5

Minilang.new('5 PUSH POP POP PRINT').eval
# Empty stack!

Minilang.new('3 PUSH PUSH 7 DIV MULT PRINT ').eval
# 6

Minilang.new('4 PUSH PUSH 7 MOD MULT PRINT ').eval
# 12

Minilang.new('-3 PUSH 5 XSUB PRINT').eval
# Invalid token: XSUB

Minilang.new('-3 PUSH 5 SUB PRINT').eval
# 8

Minilang.new('6 PUSH').eval
# (nothing printed; no PRINT commands)

# OFFICIAL SOLUTION

require 'set'

class MinilangRuntimeError < RuntimeError; end
class BadTokenError < MinilangRuntimeError; end
class EmptyStackError < MinilangRuntimeError; end

class Minilang
  ACTIONS = Set.new %w(PUSH ADD SUB MULT DIV MOD POP PRINT)

  def initialize(program)
    @program = program
    @stack = []
    @register = 0
  end

  def eval
    @program.split.each { |token| eval_token(token) }
  rescue MinilangRuntimeError => error
    puts error.message
  end

  private

  def eval_token(token)
    if ACTIONS.include?(token)
      send(token.downcase)
    elsif token =~ /\A[-+]?\d+\z/
      @register = token.to_i
    else
      raise BadTokenError, "Invalid token: #{token}"
    end
  end

  def push
    @stack.push(@register)
  end

  def pop
    raise EmptyStackError, "Empty stack!" if @stack.empty?
    @register = @stack.pop
  end

  def add
    @register += pop
  end

  def div
    @register /= pop
  end

  def mod
    @register %= pop
  end

  def mult
    @register *= pop
  end

  def sub
    @register -= pop
  end

  def print
    puts @register
  end
end
