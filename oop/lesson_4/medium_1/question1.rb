# 120 OOP: Lesson 4: Exercises: Medium 1  (26 May 2017)
# Question 1

# Ben asked Alyssa to code review the following code:

class BankAccount
  attr_reader :balance

  def initialize(starting_balance)
    @balance = starting_balance
  end

  def positive_balance?
    balance >= 0
  end
end

# Alyssa glanced over the code quickly and said - "It looks fine, except that you forgot
# to put the @ before balance when you refer to the balance instance variable in the body
# of the positive_balance? method."

# "Not so fast", Ben replied. "What I'm doing here is valid - I'm not missing an @!"

# Who is right, Ben or Alyssa, and why?

# Answer: Ben is right. Because an attr_reader is defined, ruby has created
# a getter method for balance automatically. The built-in getter method returns
# the value of balance on line 14 and then does the comparison to 0.