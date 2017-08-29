# Challenges: Easy 1
# 21 August, 2017
# Exercise 2: Sieve of Eratosthenes

# class Sieve
# 	def initialize(limit)
# 		@limit = limit
# 		@prime_table = create_prime_table
# 	end

# 	def primes
# 		@prime_table.each do |num, is_prime|
# 			if is_prime
# 				(num..@limit).step(num) do |multiple|
# 					next if multiple == num
# 					@prime_table[multiple] = false
# 				end
# 			end
# 		end

# 		@prime_table.select { |num, is_prime| is_prime }.keys
# 	end

# 	private

# 	def create_prime_table
# 		range = (2..@limit).to_a
# 		array_of_true = Array.new(@limit - 1, true)

# 		range.zip(array_of_true).to_h
# 	end
# end

# Alternate solution
class Sieve
	def initialize(limit)
		@limit = limit
		@range = (2..@limit)
	end

	def primes
		numbers = @range.to_a
		
		@range.each do |num|
			(num..@limit).step(num) do |multiple|
				next if multiple == num
				numbers.delete(multiple)
			end
		end

		numbers
	end
end

# Refactor
# class Sieve
# 	def initialize(limit)
# 		@limit = limit
# 	end

# 	def primes
# 		range = (2..@limit).to_a

# 		range.each do |prime|
# 			range.reject! { |num|  num % prime == 0 && prime != num }
# 		end
# 	end
# end