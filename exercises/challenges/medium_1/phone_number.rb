# Challenges: Medium 1
# 23 August, 2017
# Exercise 8: Phone Number

class PhoneNumber
  attr_reader :number
  
  def initialize(raw_input)
    @number = format(raw_input)
  end

  def area_code
    @number.slice(0, 3)
  end

  def format(raw_input)
    digits = raw_input.gsub(/[^[[:alnum:]]]/, '')
    return '0'*10 if invalid?(digits)

    digits.size == 11 ? digits[1..-1] : digits
  end

  def to_s
    @number.sub(/(\d{3})(\d{3})(\d{4})/, "(\\1) \\2-\\3")
  end

  private

  def invalid?(digits)
    digits.match(/[^0-9]/) ||
    digits.size < 10 ||
    digits.size == 11 && digits[0] != '1' ||
    digits.size > 11
  end
end