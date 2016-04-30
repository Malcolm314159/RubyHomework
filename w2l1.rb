#Malcolm Littlefield
#SIBos w2l1

def SingBeerSong(b)
	puts " "
	puts "#{b} bottles of beer on the wall"
	puts "#{b} bottles of beeeeeeer!"
	puts "Take one down and pass it around"
	puts "#{b-1} bottles of beer on the wall"
	puts " "
end

numBottles = 99
while numBottles > 1
	SingBeerSong(numBottles)
	numBottles -= 1
end

puts " "
puts "1 bottle of beer on the wall"
puts "1 bottle of beeeeeer"
puts "Take one down and pass it around"
puts "No more bottles of beer on the wall"
puts " "
puts "No more bottles of beer on the wall"
puts "No more bottles of beeeeeeer"
puts "Go to the store and buy some more"
puts "99 bottles of beer on the wall!"
puts " "