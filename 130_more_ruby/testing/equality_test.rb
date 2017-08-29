require 'minitest/autorun'

class EqualityTest < Minitest::Test
	def test_value_equality
		str1 = "hi there"
		str2 = "hi there"

		assert_equal(str1, str2) # passes (uses str1 == str2)
		assert_same(str1, str2) # fails (uses str1.equal?(str2), comparing object id's)
	end
end