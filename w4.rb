#Malcolm Littlefield
#May 2016
#SIBos Intro Ruby
#Week 4 lab: BLACKJACK

def new_deck #gives you a freshly shuffled deck
	deck = [1,2,3,4,5,6,7,8,9,10,10,10,10]*4
	deck = deck.shuffle
	deck
end

class Dealer
	def initialize(name)
		@name = name
		@hand = []
	end

	def receives_card(new_card)
		@hand << new_card
	end

	def clear_hand
		@hand = []
	end

	def display_hand
		puts " "
		puts "This is the dealer's hand."
		puts @hand[0].to_s + " *"*(@hand.length-1)
	end

	def display_full_hand
		hand_value = 0
		@hand.each { |i| hand_value += i }
		print @hand
		print " => #{hand_value}   "
		hand_value
	end

end

class Player
	def initialize(name, money)
		@name = name
		@hand = []
		@money = money
	end

	def receives_card(new_card)
		@hand << new_card
	end

	def clear_hand
		@hand = []
	end

	def display_hand
		hand_value = 0
		@hand.each { |i| hand_value += i }
		puts " "
		puts "This is your hand."
		print @hand
		print " => #{hand_value}   "
		hand_value
	end

	def money
		@money
	end

	def adjust_money(a)
		@money += a
	end

	def display_money
		puts " "
		puts "You have #{@money} dollars."
		puts " "
	end
end

def blackjack(player, dealer)
	#start each round with a freshly shuffled deck
	deck = new_deck 
	#Deal out hands
	player.receives_card(deck.pop)
	player.receives_card(deck.pop)
	dealer.receives_card(deck.pop)
	dealer.receives_card(deck.pop)

	#Display the board
	dealer.display_hand
	hand = player.display_hand
	player.display_money

	#promp the player for her/his bid
	puts "How much would you like to bid?"
	bid = gets.chomp.to_i

	#see how many times the player would like to hit
	stay = false
	while hand < 21 && stay == false
		puts " "
		puts "Hit or stay? (hit/stay)"
		input = gets.chomp.to_s.downcase
		if input == "stay"
			stay = true
			puts "You have selected to stay"
			puts " "
			puts "The dealer's hand is as follows"
		elsif input == "hit"
			player.receives_card(deck.pop)
			hand = player.display_hand
		else
			puts "Please specify."
		end
	end

	#evaluate the player's hand
	if hand > 21
		puts "Bust!"
		player.adjust_money(-bid)
	elsif hand == 21
		puts "Blackjack!"
	end
	
	#if the player isn't busted, let the dealer hit.
	if hand <= 21
		dealer_hand = dealer.display_full_hand
		#the dealer hits until his hand is >= 17
		while dealer_hand < 17
			puts " "
			puts "The dealer hits and gets..."
			dealer.receives_card(deck.pop)
			dealer_hand = dealer.display_full_hand
		end

		#evaluate the two hands
		if dealer_hand > 21
			puts "The dealer is busted!"
			player.adjust_money(bid)
		elsif dealer_hand == hand
			puts "It's a tie."
		elsif dealer_hand > hand
			puts "The dealer won this round."
			player.adjust_money(-bid)
		else
			puts "You won this round!"
			player.adjust_money(bid)
		end
	end

	#Clear the cards and end the round
	player.clear_hand
	dealer.clear_hand
	puts "ROUND OVER"
end

def main
	puts " "
	puts "You are now playing a game of blackjack!"
	puts " "
	puts "How many dollars are you starting with?"
	$money = gets.chomp.to_i

	player = Player.new("Malcolm", $money)
	dealer = Dealer.new("Justin")

	while player.money < $money*2 && player.money > 0
		blackjack(player, dealer)
	end

	if player.money > $money
		puts " "
		puts "Good job you have stacks on stack, cash out!"
	else
		puts " "
		puts "Shucks you didn't make money :("
	end
end