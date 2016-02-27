class Number
	attr_accessor :num

	def initialize(num)
		@num = num
	end 

	def is_palindrome?
		div = 1
		t = @num
		
		while t > 10
			div = div*10
			t = t/10
		end 

		t = @num 

		while t > 10
			l = t/div
			r = t%10
			if l != r
				return false 
			end
			t = (t%div)/10
			div = div/100
		end

		return true
	end
end

n = Number.new(12321)
puts n.is_palindrome? # Odd palindrome => true

n = Number.new(123321)
puts n.is_palindrome? # Even Palindrome => true

n = Number.new(123212)
puts n.is_palindrome? # Not a Palindrome => false