class Exchange
	attr_accessor :denom, :min_change

	def initialize(denom)
		@denom = denom
		@min_change = {}
	end

	def req_change(sum)
		changes = []
		@denom.each do |d|
			next_change = sum - d
			if next_change < 0
				next
			elsif next_change == 0
				changes << 0
			elsif !min_change[next_change].nil?
				changes << min_change[next_change]
			else
				changes << req_change(next_change)
			end
		end 
		min_change[sum] = changes.min.to_i + 1
		return min_change[sum]
	end 
end

ex = Exchange.new([1,2,3])
p ex.req_change(5)

# Output: 2 # coin combination is => (3,2)