# Exercises: 120 Object-Oriented Programming: Easy 1
# 8 June 2017
# Exercise 1

class Banner
	attr_reader :message, :width

  def initialize(message, width = message.size)
  	@message = message
  	@width = (width < message.size ? message.size : width)
  end

  def to_s
    [horizontal_rule, empty_line, message_line, empty_line, horizontal_rule].join("\n")
  end

  private

  def horizontal_rule  	
  	"+-#{'-' * width}-+"
  end

  def empty_line
  	"| #{' ' * width} |"
  end

  def message_line
    "| #{message.center(width)} |"
  end
end

# Test cases

banner = Banner.new('To boldly go where no one has gone before.', 50)
puts banner
# +--------------------------------------------+
# |                                            |
# | To boldly go where no one has gone before. |
# |                                            |
# +--------------------------------------------+

banner = Banner.new('')
puts banner
# +--+
# |  |
# |  |
# |  |
# +--+