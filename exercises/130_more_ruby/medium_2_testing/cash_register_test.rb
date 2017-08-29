require 'minitest/autorun'
require_relative 'cash_register'
require_relative 'transaction'

class CashRegisterTest < MiniTest::Test
	def setup
		@total_money = 0
		
		@register = CashRegister.new(@total_money)
		@transaction = Transaction.new(75)
		@transaction.amount_paid = 100
	end

	def test_accept_money
		@register.accept_money(@transaction)
		@total_money += @transaction.amount_paid

		assert_equal(@total_money, @register.total_money)
	end

	def test_change
		assert_equal(25, @register.change(@transaction))
	end

	def test_give_receipt
		output = "You've paid $75.\n"
		assert_output(output) { @register.give_receipt(@transaction) }
	end
end 