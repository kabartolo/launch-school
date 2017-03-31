# Easy 2: Exercise 3: Tip Calculator (30 March 2017)

# Create a simple tip calculator. The program should prompt for
# a bill amount and a tip rate. The program must compute the tip
# and then display both the tip and the total amount of the bill.

# Example:

# What is the bill? 200
# What is the tip percentage? 15

# The tip is $30.0
# The total is $230.0

def calculate_tip
  puts "What is the bill?"
  bill_amt = gets.chomp.to_f

  puts "What is the tip percentage?" 
  tip_percent = gets.chomp.to_f

  tip = bill_amt * (tip_percent / 100.0)
  total = bill_amt + tip

  puts "The tip is #{format('%.2f', tip)}."
  puts "The total is $#{format('%.2f', total)}."
end

calculate_tip
