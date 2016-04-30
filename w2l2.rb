#Malcolm Littlefield
#SIBos Week 2 Lab 2
#Deaf Grandma

puts " "
puts "You are now having a conversation with your grandmother; say something to her!"
puts " "

def response1()
	year = 1930 + rand(50)
	puts " "
	puts "NO, NOT SINCE #{year}!"
	puts " "
end

def response2()
	puts " "
	puts "HUH!?, SPEAK UP SONNY!"
	puts " "
end

def response3()
	puts " "
	puts "I AGREE, YOU SHOULD STAY!"
	puts " "
end

def response4()
	puts " "
	puts "CAN YOU HELP ME MOVE THIS TABLE?"
	puts " "
end

def response5()
	puts " "
	puts "BYE SONNY!"
	puts " "
end

def startConversation(input)
	while input != "BYE"
		if input == input.upcase
			response1()
			input = gets.chomp.to_s
		else
			response2()
			input = gets.chomp.to_s
		end
	end
	response3()
	byeCount = 1
end

byeCount = 0
input = gets.chomp.to_s

while byeCount < 3
	startConversation(input)
	input = gets.chomp.to_s
	if input == "BYE"
		byeCount = 2
		response4()
		input = gets.chomp.to_s
	end
	if input == "BYE"
		byeCount = 3
		response5()
	end
end


