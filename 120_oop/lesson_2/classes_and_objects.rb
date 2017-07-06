# 120 OOP: Lesson 2: Classes and Objects  (18 May 2017)

# Given the below usage of the Person class, code the class definition.

class Person
  attr_accessor :name

  def initialize(name)
    @name = name
  end
end

# bob = Person.new('bob')
# bob.name                  # => 'bob'
# bob.name = 'Robert'
# puts bob.name                  # => 'Robert'


class Person
  attr_accessor :first_name, :last_name

  def initialize(full_name)
    parts = full_name.split
    @first_name = parts.first
    @last_name = parts.size > 1 ? parts.last : ''
  end

  def name
    "#{@first_name} #{@last_name}"
  end
end

# bob = Person.new('Robert')
# puts bob.name                  # => 'Robert'
# puts bob.first_name            # => 'Robert'
# p bob.last_name             # => ''
# bob.last_name = 'Smith'
# p bob.name                  # => 'Robert Smith'
# kate = Person.new('Kate Adair')
# puts kate.name

class Person
  attr_accessor :first_name, :last_name

  def initialize(full_name)
    parse_full_name(full_name)
  end

  def name
    "#{@first_name} #{@last_name}"
  end

  def name=(full_name)
    parse_full_name(full_name)
  end

  private

  def parse_full_name(full_name)
    parts = full_name.split
    self.first_name = parts.first #  using @first_name also works?
    self.last_name = parts.size > 1 ? parts.last : ''
  end
end

bob = Person.new('Robert')
puts bob.name                  # => 'Robert'
puts bob.first_name            # => 'Robert'
puts bob.last_name             # => ''
bob.last_name = 'Smith'
puts bob.name                  # => 'Robert Smith'

bob.name = "John Adams"
puts bob.first_name            # => 'John'
puts bob.last_name             # => 'Adams'
puts bob.name

# If we're trying to determine whether the two objects contain the
# same name, how can we compare the two objects?

bob = Person.new('Robert Smith')
rob = Person.new('Robert Smith')
puts bob.name == rob.name

# What does the following print out?
bob = Person.new("Robert Smith")
puts "The person's name is: #{bob}"

# => The person's name is: #<Person:0x00000001e51090>

# Add a to_s method to the class

class Person
  attr_accessor :first_name, :last_name

  def initialize(full_name)
    parse_full_name(full_name)
  end

  def name
    "#{@first_name} #{@last_name}"
  end

  def name=(full_name)
    parse_full_name(full_name)
  end

  def to_s
    name
  end

  private

  def parse_full_name(full_name)
    parts = full_name.split
    self.first_name = parts.first #  using @first_name also works?
    self.last_name = parts.size > 1 ? parts.last : ''
  end
end
puts "The person's name is: #{bob}"
# The person's name is: Robert Smith
