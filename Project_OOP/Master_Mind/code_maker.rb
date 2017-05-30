class CodeMaker
	attr_reader :code
	attr_reader :f_index
	def initialize
		@code = []
		@code = generate_code()
	end

	def generate_code
		colors = {0=>'red', 1=>'blue', 2=>'green', 3=>'pink', 4=>'purple', 5=>'orange'}
		for i in 0..3 do
			j = rand(5)
			@code[i] = colors[j]
		end
		@code
	end

	def feed_back(guess)
		temp = guess.dup
		feedback = [-1,-1,-1,-1]
		code = @code.dup
		@f_index = 0
		unless compare(guess)
			#fill in position and color matches first
			match_items(temp,code,feedback)
			puts "f new value is #{@f_index}"
			print feedback
			#fill in color matches
			match_items(temp,code,feedback,'white')
			print feedback
			puts "f new value is #{@f_index}"
			#generate feedback
		else
			feedback = ["black","black","black","black"]
		end
		feedback
	end

	def compare(guess)
		@code == guess
	end

	def match_items(guess,code, feedback, flag='black')
		for g in 0..3 do
			match = false
			c = 0
			while !match do
				if flag == 'black'
					if guess[g] == code[c]
						if g == c
							match = true 
							feedback[@f_index] = 'black'
							@f_index += 1
							code[c] = -1 
							guess[g] = -2
						end
					end
				else
					if guess[g] == code[c]
						match = true
						feedback[@f_index] = 'white'
						code[c] = -1
						@f_index += 1
					end
				end
				match = true if c == 3
				c += 1
			end
		end

	end


end