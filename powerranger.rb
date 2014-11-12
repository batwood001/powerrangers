module Violence

	def punch(person, strength)
		if self.caffeine_decrement(strength)
			puts "#{@name} socks #{person.name}: *Pow!*"
			if strength > 5
				puts "#{person.name} somersalts into the air!"
			end
			person.scream
			person.run
			person.caffeine_decrement(strength)
		else
			puts "#{@name}'s too tired to punch that hard!"
		end
		self.caffeine_decrement(strength)
	end
end


class Person

	attr_accessor :name, :caffeine_level

	def initialize(name, caffeine_level=5)
		@name = name
		@caffeine_level = caffeine_level
	end

	def run
		puts "*patter patter pat pat*"
	end

	def scream
		puts "#{@name}: AHHHHH!"
	end

	def drink_coffee
		puts "*gulp!*"
		@caffeine_level += 1
	end

	def caffeine_decrement(amount)
		if @caffeine_level - amount < 0
			return false
		else
			@caffeine_level -= amount
			return true
		end
	end

end

class PowerRanger < Person

	include Violence

	attr_accessor :color, :caffeine_level, :color

	def initialize(name, caffeine_level=5, color)
		super(name, caffeine_level)
		@color = color
	end

	def use_megazord(person)
		person.caffeine_decrement(5000)
		puts "#{@name} uses MEGAZORD! *KAPLOOEY!* #{person.name}'s not getting up for a while..."
	end

	def rest(duration)
		@caffeine_level += duration
		puts "#{@name}: Ahh, I feel rejuvenated!"
	end
end

class EvilNinja < Person

	include Violence

	def initialize(name, caffeine_level=5, evilness=10)
		super(name, caffeine_level)
		@evilness = evilness
	end

	def cause_mayhem(person)
		person.caffeine_level = 0
		puts "#{person.name}'s caffeine level is totally depleted! This is disastrous!"
	end

end

def fight_scene
	bob = Person.new("Bob")
	steve = Person.new("Steve")
	blue_ranger = PowerRanger.new("Blue Ranger", 5, "Blue")
	red_ranger = PowerRanger.new("Red Ranger", 5, "Red")
	ninja1 = EvilNinja.new("Robert")
	ninja2 = EvilNinja.new("Hampstead")

	bob.drink_coffee
	ninja1.punch(bob, 3)
	blue_ranger.punch(ninja1, 2)
	ninja2.cause_mayhem(blue_ranger)
	steve.scream
	red_ranger.use_megazord(ninja1)
	red_ranger.use_megazord(ninja2)
	red_ranger.drink_coffee
end

