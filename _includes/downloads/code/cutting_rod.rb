class Rod
	attr_accessor :price_list, :cache

	def initialize(price_list)
		@price_list = price_list 
		@cache = {}
	end 

	def cut(n)
		return 0 if n < 1
		val = []
		n.times do |i|
			i = i+1
			if @cache[n-i].nil?
				val << cut(n-i) + @price_list[i]
			else 
				val << @price_list[i] + @cache[n-i]
			end 
		end 
		@cache[n] = val.max
		return @cache[n]
	end
end

rd = Rod.new({
	1 => 1, 2 => 5, 3 => 8,
 	4 => 9, 5 => 10, 6 => 17,
 	7 => 17, 8 => 20
 	})

p rd.cut(5)

# Output: 13 # => 2 -> 5, 3 -> 8 = 8 + 5 => 13