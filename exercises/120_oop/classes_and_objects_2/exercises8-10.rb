# Exercises: 120 Object-Oriented Programming: OO Basics: Classes and Objects 2
# Exercises 8-10

# 8.
class Person
  attr_accessor :secret
end

person1 = Person.new
person1.secret = 'Shh.. this is a secret!'
puts person1.secret

# 9.
class Person
  attr_writer :secret

  def share_secret
    puts secret
  end

  private

  attr_reader :secret
end

person1 = Person.new
person1.secret = 'Shh.. this is a secret!'
person1.share_secret

#10.
class Person
  attr_writer :secret

  def compare_secret(person2)
    secret == person2.secret
  end

  protected # => allows access between class instances

  attr_reader :secret
end

person1 = Person.new
person1.secret = 'Shh.. this is a secret!'

person2 = Person.new
person2.secret = 'Shh.. this is a different secret!'

puts person1.compare_secret(person2)