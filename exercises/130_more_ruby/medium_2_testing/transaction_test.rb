require 'minitest/autorun'
require_relative 'cash_register'
require_relative 'transaction'

class TransactionTest < MiniTest::Test
	def setup
		@transaction = Transaction.new(75)
	end

	def test_prompt_for_payment_errors

    
    # The input string contains invalid payments and one valid payment.
  	# It is split into separate inputs by newline by Kernel#gets.
    # (Solution from Christina Unger and Brandon Conway at 
    # https://launchschool.com/posts/b386741b, except my solution compares the full
    # output text to the HEREDOC).

    input = StringIO.new("-20\n50\n100")
		output = <<~OUTPUT.chomp
							You owe $75.
							How much are you paying?
							That is not the correct amount. Please make sure to pay the full cost.
							You owe $75.
							How much are you paying?
							That is not the correct amount. Please make sure to pay the full cost.
							You owe $75.
							How much are you paying?

     				OUTPUT
    assert_output(output) { @transaction.prompt_for_payment(input: input) }
		assert_equal(100, @transaction.amount_paid)
	end

	def test_prompt_for_payment
		input = StringIO.new('100')
		output = StringIO.new

		@transaction.prompt_for_payment(input: input, output: output)
		assert_equal(100, @transaction.amount_paid)
	end
end
