def ceasar_cipher (msg, shift_factor)
	new_msg = ""
	for word in msg.split(" ") 
		word.each_char do |char|
			ascii = char.ord 
			#lower case ascii
			if ascii >= 97 && ascii <= 122
				# range 0 to 25 = a to z
				new_ascii = (ascii - 97 + shift_factor) % 26
				ascii = new_ascii + 97
			elsif ascii >=65 && ascii <= 90		
				new_ascii = (ascii - 65 + shift_factor) % 26
				ascii = new_ascii + 65
			end
			new_msg += ascii.chr
		end
		new_msg += " "
	end
	puts new_msg.chomp(" ")
end




ceasar_cipher("The quick brown fox jumped over the lazy dog !",53)
