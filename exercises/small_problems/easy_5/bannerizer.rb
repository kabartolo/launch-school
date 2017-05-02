# Easy 5: Exercise 10: Bannerizer (10 April 2017)

# Write a method that will take a short line of text, and print it within a box.

# Example:

# print_in_box('To boldly go where no one has gone before.')
# +--------------------------------------------+
# |                                            |
# | To boldly go where no one has gone before. |
# |                                            |
# +--------------------------------------------+

# print_in_box('')
# +--+
# |  |
# |  |
# |  |
# +--+

# You may assume that the input will always fit in your terminal window.

MAX_MESSAGE_WIDTH = 76

# def wrap_line(message)
#   lines = []

#   if message.size > MAX_MESSAGE_WIDTH
#     start = 0
#     width = MAX_MESSAGE_WIDTH
#     loop do
#       lines << message[start..width - 1].center(MAX_MESSAGE_WIDTH)
#       start = width
#       break if width > message.size
#       width *= 2
#     end
#   else
#     lines << message
#   end

#   lines
# end

def wrap_line(message, width)
  lines = message.scan(/(\S.{,#{width}})(?=\s|\z)/).map(&:first)
end

def print_in_box(message)
  width = [message.size, MAX_MESSAGE_WIDTH].min + 2

  message_lines = wrap_line(message, MAX_MESSAGE_WIDTH).map do
    |line| "| #{line} #{' '*(width - line.size - 2)}|"
  end

  border_line = "+#{'-'*width}+"
  empty_line =  "|#{' '*width}|"
  puts border_line, empty_line, message_lines, empty_line, border_line
end

print_in_box('Twas brillig, and the slithy toves. Did gyre and gimble in the wabe: All mimsy were the borogoves, And the mome raths outgrabe.')
print_in_box('To boldly go where no one has gone before.')
print_in_box('')
