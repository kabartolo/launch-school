require 'minitest/autorun'
require_relative 'odd_words'

class AnagramTest < Minitest::Test
  def test_single_spaces
    input = 'lots  of    spaces   .   '
    output = 'lots fo spaces.'
    assert_equal(output, OddWords.new(input).transform)
  end

  def test_simple_case
  	input = 'whats the matter with kansas.'
  	output = 'whats eht matter htiw kansas.'
  	assert_equal(output, OddWords.new(input).transform)
  end

  def test_odd_word_period
  	input = 'whats the matter with.'
  	output = 'whats eht matter htiw.'
  	assert_equal(output, OddWords.new(input).transform)
  end

  def test_one_word
  	input = 'hey.'
  	output = 'hey.'
  	assert_equal(output, OddWords.new(input).transform)
  end
end