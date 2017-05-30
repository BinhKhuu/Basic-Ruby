class CodeBreaker
	attr_reader  :code

	def initialize
		@code = []
	end

	def guess_code
		puts "enter 4 colors seperated by a space type q to quit"
		puts "options are:"
		puts "1: red 2: blue 3: pink\n4: purple 5: orange 6: green"
		puts "example: red red red orange\nexample: q -will exit the game"
		puts "\n"

		#get user input
		@code = gets.chomp.split(" ")
		unless @code.include? 'q'
			while @code.length != 4  
				puts "enter 4 colors seperated by a space"
				puts "options are:"
				puts "1: red 2: blue 3: pink\n4: purple 5: orange 6: yellow"
				puts "example: red red red orange"
				puts "\n"
				@code = gets.chomp.split(" ")
			end
		end
	end
end


