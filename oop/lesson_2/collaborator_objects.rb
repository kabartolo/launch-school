# 120 OOP: Lesson 2: Collaborator Objects  (20 May 2017)

class Person
  attr_accessor :name, :pets

  def initialize(name)
    @name = name
    @pets = []
  end
end

bob = Person.new("Robert")

kitty = Cat.new
bud = Bulldog.new             # assume Bulldog class from previous assignment

bob.pets << kitty
bob.pets << bud

bob.pets # => [#<Cat:0x007fd839999620>, #<Bulldog:0x007fd839994ff8>]

bob.pets.each do |pet|
  pet.jump
end

