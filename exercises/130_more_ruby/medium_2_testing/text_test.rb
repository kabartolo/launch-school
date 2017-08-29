require 'minitest/autorun'
require_relative 'text'

class TextTest < MiniTest::Test
	def setup
		@text_file = File.new('sample.txt')
		@text = Text.new(@text_file.read)
		@text_file.rewind
	end

	def test_swap
		swapped_text = @text_file.read.gsub('a', 'e')
		assert_equal(swapped_text, @text.swap('a', 'e'))
	end

	def test_word_count
		assert_equal(72, @text.word_count)
	end

	def teardown
		@text_file.close
		puts "File has been closed: #{@text_file.closed?}"
	end
end