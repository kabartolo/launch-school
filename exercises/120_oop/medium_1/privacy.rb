# Exercises: 120 Object-Oriented Programming: Medium 1
# 16 June 2017
# Exercise 1

# Privacy

# Consider the following class:

class Machine
  def start
    flip_switch(:on)
  end

  def stop
    flip_switch(:off)
  end

  def on?
  	switch == :on
  end

  private

  attr_accessor :switch

  def flip_switch(desired_state)
    self.switch = desired_state
  end
end

# Modify this class so both flip_switch and the setter
# method switch= are private methods.

machine = Machine.new
machine.start
puts machine.on? # => true
machine.stop
puts machine.on? # => false