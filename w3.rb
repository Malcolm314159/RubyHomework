#w3l1.rb

chars = " "
chars += "abcdefghijklmnopqrstuvwxyz"
chars += "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
chars += "0123456789"
chars += "!@#$%^&*()_+-=[]|{}:;'?/><,."

randomizer = Array.new #this will be an array with one integer for each character
for i in 0..(chars.length-1)
	randomizer << i
end
randomizer = randomizer.shuffle

$cipher = Hash.new #A hash of all characters. values are shuffled around
a = 0
for i in randomizer
	$cipher[chars[a]] = chars[i]
	a += 1
end

def encrypt(a)
	b = String.new
	for i in 0..(a.length-1)
		b += $cipher[a[i]]
	end
	return b
end

def decrypt(a)
	b = String.new
	for i in 0..(a.length-1)
		b += $cipher.key(a[i])
	end
	return b
end