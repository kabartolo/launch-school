# 101 Lesson 2 (17 March 2017)
# Assignment: Mortgage/Car Loan Calculator

# See mortgage_calculator.txt for problem model and pseudocode

#---Helper methods---#

# Validate string input
#   Valid: positive floats/integers, strings like ".2"
#   Not valid: 0, negative numbers, strings like "2.",
#     strings with letter chars
def valid_number?(input)
  /^\d+(\.\d+)?$/.match(input) || /^\.\d+/.match(input)
end
# => MatchData object or nil

def valid_input?(input)
  valid_number?(input) && !input.to_f.zero?
end
# => true, false or nil

def valid_percentage?(num)
  num > 0 && num <= 100
end

def prompt(message)
  puts "\n=>#{message}"
end

def print_result(input)
  puts "  | #{input} |"
end

def format_two_decimals(number)
  format('%.2f', number.round(2))
end

def get_info(ask_message, error_message)
  loop do
    prompt(ask_message)
    input = gets.chomp
    return input if valid_input?(input)
    prompt(error_message)
  end
end

# Do an extra check for valid percentage value
def get_apr(ask_message, error_message)
  loop do
    apr = get_info(ask_message, error_message)
    return apr if valid_percentage?(apr.to_f)
    prompt(error_message)
  end
end

# p = loan amount, j = monthly interest rate, n = term in months
# Returns monthly payment amount
def calculate_monthly_pmt(p, j, n)
  p * (j / (1 - (1 + j)**-n))
end

#---Program start---#
prompt("Welcome to Mortgage Calculator! Press Ctrl + c to exit.")

loop do
  #---Get information from the user---#
  loan_message = 'Loan amount:'
  loan_error = 'Loan amount must be a positive number with no commas.'

  loan_amt = get_info(loan_message, loan_error).to_f
  print_result("$#{format_two_decimals(loan_amt)}")

  apr_message = 'Annual percentage rate (APR): __%'
  apr_error = 'APR must be a positive number <= 100.'

  apr = get_apr(apr_message, apr_error).to_f
  print_result("#{apr}%")

  term_message = 'Enter the loan term in years:'
  term_error = 'Loan term must be a positive number with no commas.'

  term_years = get_info(term_message, term_error).to_f
  print_result("#{term_years} years")

  #---Convert information for formula---#

  monthly_int_rate = (apr / 12) / 100
  term_months = term_years * 12

  #---Calculate and print user's monthly payment---#

  monthly_pmt = calculate_monthly_pmt(loan_amt, monthly_int_rate, term_months)

  prompt("Your monthly payment amount is:")
  print_result("$#{format_two_decimals(monthly_pmt)}")

  prompt("Do you want to start over? 'Y' for yes, or any key to exit.")
  answer = gets.chomp.downcase
  unless answer.start_with?('y')
    prompt("Goodbye!")
    break
  end
end

# ---Test Cases---#
# puts
# puts "Test Cases should all return true"
# puts "valid_input?"
# puts valid_input?('-1.5').nil?
# puts valid_input?('-3').nil?
# puts valid_input?('0') == false
# puts valid_input?('3') == true
# puts valid_input?('240000302') == true
# puts valid_input?('0.4') == true
# puts valid_input?('.4') == true
# puts valid_input?('3.').nil?
# puts valid_input?('four').nil?

# puts
# puts "valid_percentage?"
# puts valid_percentage?(101) == false
# puts valid_percentage?(100) == true
# puts valid_percentage?(400) == false
# puts valid_percentage?(0.5) == true
# puts valid_percentage?(2.5) == true
# puts valid_percentage?(3) == true
# puts valid_percentage?(0) == false
# puts valid_percentage?(-1) == false

# puts
# puts "calculate_monthly_pmt"
# puts calculate_monthly_pmt(5000, 4.5 / 12 / 100, 5 * 12).round(2) == 93.22
# puts calculate_monthly_pmt(50000, 14.5 / 12 / 100, 25 * 12).round(2) == 621.08
# puts calculate_monthly_pmt(0.5, 0.1 / 12 / 100, 900 * 12).round(2) == 0.00
