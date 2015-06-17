def caesar_cipher(input, val)
	#convert input string to an array of words
	#then each word will be converted into an array of chars
	#so the whole array contains arrays of chars
	text = input.split.collect{|entry| entry.split('')}
	#change each element within the char arrays based on the following
	text.collect{|array| array.collect! do |char|
		#if A-Z and goes beyond Z after shifting --> wrap back to A
		if (char.ord >= 65 && char.ord <= 90 && char.ord + val > 90)
			char.ord + val - 26
		#if a-z and goes beyond z after shifting --> wrap back to a
		elsif (char.ord >= 97 && char.ord <= 122 && char.ord + val > 122)
			char.ord + val - 26
		#if original input NOT 0-9, A-Z, or a-z, keep the same
		elsif !((char.ord >= 48 && char.ord < 57) || (char.ord >= 
					65 && char.ord <= 90) || (char.ord >= 97 && char.ord <= 122))
			char.ord
		#everything else should just be shifted by the caesar value
		else
			char.ord + val
		end
	end}	
	#if the chars are numbers 0-9, have them wrap back to 0 if they exceed 9
	#then the chars in each internal array will be joined to reform a word
	text.collect!{|array| array.collect! do|num| 
		if num - val >= 48 && num - val <= 57
			if (num - 48) < 10
				(num - 48).to_s
			else
				(num - 58).to_s
			end
		else
			num.chr
		end
	end.join('')}
	#the reformed words will be joined to reform a string of words
	text = text.join(' ')
end

def run
	puts "Enter text to be encrypted:"
	user_input = gets.chomp

	sf = 26
	while sf >= 26 do
		puts "Enter shift factor:"
		sf = gets.to_i
		if (sf >= 26)
			puts "Please enter a value less than 26"
		end
	end

	puts caesar_cipher(user_input, sf)
end

run