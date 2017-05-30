class CodeMaker
	attr_reader :code
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
		feed_back = [-1,-1,-1,-1]
		code = @code.dup
		f = 0
		match = false
		unless compare(guess)
			for g in 0..3 do
				c = 0 
				match = false
				while !match do
					if guess[g] == code[c]
						match = true
						if g == c
							feed_back[f] = 'black'
						else
							feed_back[f] = 'white'
						end
						f += 1
						#remove element to avoid matching twice
						code[c] = nil
					end
					#end loop when index overbound
					match = true if c == 3
					c += 1
				end
			end
		else
			feed_back = ["black","black","black","black"]
		end
		feed_back
	end

	def compare(guess)
		@code == guess
	end

end

