# Exercises: 120 Object-Oriented Programming: Easy 2
# 16 June 2017
# Exercise 7

# Pet Shelter
# Solution:

class Pet
	def initialize(animal, name)
		@animal = animal
		@name = name
	end

	def to_s
		"a #{@animal} named #{@name}"
	end
end

class Owner
	attr_reader :name, :pets

	def initialize(name)
		@name = name
		@pets = []
	end

	def add_pet(pet)
		@pets << pet
	end

	def number_of_pets
		pets.size
	end

	def to_s
		name
	end
end

class Shelter
	attr_reader :adoptions, :available_pets

	def initialize
		@adoptions = {}
		@available_pets = []
	end

	def adopt(owner, pet)
		owner.add_pet(pet)
		adoptions[owner] = owner.pets
		available_pets.delete(pet) if available_pets.include?(pet)
	end

	def take_in(pet)
		available_pets << pet
	end

	def print_adoptions
		adoptions.each do |owner, pet|
			puts "#{owner} has adopted the following pets:"
			puts owner.pets
			puts
		end
	end

	def print_available_pets
		puts "The Animal Shelter has the following unadopted pets:"
		puts available_pets
	end
end


# Consider the following code:
asta = Pet.new('dog', 'Asta')
butterscotch = Pet.new('cat', 'Butterscotch')
pudding      = Pet.new('cat', 'Pudding')
darwin       = Pet.new('bearded dragon', 'Darwin')
kennedy      = Pet.new('dog', 'Kennedy')
sweetie      = Pet.new('parakeet', 'Sweetie Pie')
molly        = Pet.new('dog', 'Molly')
chester      = Pet.new('fish', 'Chester')

phanson = Owner.new('P Hanson')
bholmes = Owner.new('B Holmes')

shelter = Shelter.new
shelter.take_in(asta)
shelter.take_in(butterscotch)
shelter.take_in(pudding)
shelter.adopt(phanson, butterscotch)
shelter.adopt(phanson, pudding)
shelter.adopt(phanson, darwin)
shelter.adopt(bholmes, kennedy)
shelter.adopt(bholmes, sweetie)
shelter.adopt(bholmes, molly)
shelter.adopt(bholmes, chester)
shelter.print_adoptions
puts "#{phanson.name} has #{phanson.number_of_pets} adopted pets."
puts "#{bholmes.name} has #{bholmes.number_of_pets} adopted pets."
shelter.print_available_pets

# Write the classes and methods that will be necessary to make this
# code run, and print the following output:

# P Hanson has adopted the following pets:
# a cat named Butterscotch
# a cat named Pudding
# a bearded dragon named Darwin

# B Holmes has adopted the following pets:
# a dog named Molly
# a parakeet named Sweetie Pie
# a dog named Kennedy
# a fish named Chester

# P Hanson has 3 adopted pets.
# B Holmes has 4 adopted pets.

# The Animal Shelter has the following unadopted pets:
# a dog named Asta
# a dog named Laddie
# a cat named Fluffy
# a cat named Kat
# a cat named Ben
# a parakeet named Chatterbox
# a parakeet named Bluebell
#    ...

# P Hanson has 3 adopted pets.
# B Holmes has 4 adopted pets.
# The Animal shelter has 7 unadopted pets.