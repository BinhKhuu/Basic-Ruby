class CodeBreaker
	attr_accessor :code
	attr_reader :player
	attr_accessor :possible_codes
	attr_reader :colors

	def initialize(player)
		@code = []
		@colors = {0=>'red', 1=>'blue', 2=>'green', 3=>'pink', 4=>'purple', 5=>'orange'}
		@player = player
		if @player == 1
			@possible_codes = gen_possible_codes()
		end
	end

	def guess_code(feedback)
		if @player == 2
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
				end#end while
			end#end unless
		else	
			unless feedback.any?
				@code = [colors[0], colors[0], colors[1], colors[1]]
			else
				#code goes here
				compare_guess(feedback)
				#@code = [colors[0], colors[0], colors[1], colors[1]]
				unless @possible_codes.any?
					@code = [colors[2], colors[2], colors[3], colors[3]]
				else
					@code = [colors[@possible_codes[0][0].to_i],colors[@possible_codes[0][1].to_i], 
									colors[@possible_codes[0][2].to_i], colors[@possible_codes[0][3].to_i] ]
				end


			end
		end#end if

	end

	def gen_possible_codes
		a = []
		count = 0
		for i in 0..5 
			for j in 0..5 
				for k in 0..5
					for l in 0..5
						num = i.to_s + j.to_s + k.to_s + l.to_s
						a[count] = num
						count += 1
					end
				end
			end
		end
		a
	end

	private
	def compare_guess(feedback)
		#compare the guess with possible guesses 
		dup_code = @code.dup
		#deep copy hack
		dup_list = Marshal.load(Marshal.dump(@possible_codes))
		
		temp_list = []
		len = @possible_codes.length
		#compare str_code with list of possible codes
			for i in 0..len-1
				str_code = convert_code
				cb_index = 0
				#fill in array with -1 becasue feedback is filled -1 for empty spots
				cb_feedback = [-1,-1,-1,-1]
				for j in 0..3
					match = false
					c = 0
					#fill in absolute matches
					while !match
						if dup_list[i][j] == str_code[c] && j == c
							cb_feedback[cb_index] = 'black'
							cb_index += 1
							match = true
							#remove entries to avoide rematching
							str_code[c] = "8"
							dup_list[i][j] = "9"
						end
						match = true if c == 3
						c +=1
						
					end
					
				end
				#fill in near misses
				for j in 0..3
					match = false
					c = 0
					while !match
						if dup_list[i][j] == str_code[c]
							cb_feedback[cb_index] = 'white'
							cb_index += 1
							match = true
							str_code[c] = "8"
						end
						c += 1 
						match = true if c == 3
					end
				end
				if cb_feedback == feedback
					#puts "matched!"
					#puts @possible_codes[i]
					temp_list.push(@possible_codes[i])
				end
				#temp_list.push(@possible_codes[i]) if cb_feedback == feedback
			end
			@possible_codes = temp_list
	end

	private
	#convert to possible_code format
	def convert_code
		str = ""
		for i in 0..3
			case 
			when @code[i] == "red"
				str += '0'
			when @code[i] == "blue"
				str += '1'
			when @code[i] == "green"
				str += '2'
			when @code[i] == "pink"
				str += '3'
			when @code[i] == "purple"
				str += '4'
			else
				str += '5'
			end
		end
		str
	end



end


