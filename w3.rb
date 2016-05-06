#w3l1.rb

chars = " "
chars += "abcdefghijklmnopqrstuvwxyz"
chars += "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
chars += "0123456789"
chars += "!@#$%^&*()_+-=[]|{}:;'?/><,."

cipher = Hash.new

for i in 0..(chars.length-1)
	cipher[chars[i]] = chars[rand(chars.length)]
end

def encrypt(a)
	b = String.new
	for i in 0..(a.length-1)
		b += cipher[a[i]]
	end
end

def decrypt(a)
	b = String.new
	for i in 0..(a.length-1)
		b += cipher.key(a[i])
	end
end