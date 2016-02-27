class Arrays
	attr_accessor :arr1, :arr2

	def initialize(arr1,arr2)
		@arr1 = arr1
		@arr2 = arr2
	end

	def find_kth_smallest(k)

		len_arr1 = @arr1.length
		len_arr2 = @arr2.length

		tot = (len_arr1 + len_arr2 - 1)

		if k >= tot
			return -1 
		else 
			i = 0
			j = 0
			k_cur = 0
			t = -1
			while k_cur < tot 
				if k_cur > k 
					return t
				end
				if (i < len_arr1 and @arr1[i] < @arr2[j]) or j == len_arr2
					t = @arr1[i]
					i = i+1
				elsif (j < len_arr2) or len_arr1 == i
					t = @arr2[j]
					j = j+1
				end
				
				k_cur = i + j
			end 
			return t
		end
	end
end


def method(arr)
	arr.each do |e|
		arr.each do |f|
			puts "#{e}#{f}"
		end 
	end 
	
	arr.each do |g|
		puts g
	end 
end

arrs = Arrays.new([1,3,5,7],[2,4,6,8,9,10,11,12,1,3,14,15])

puts arrs.find_kth_smallest(1) # =>  2

puts arrs.find_kth_smallest(5) # => 6

puts arrs.find_kth_smallest(3) # => 4

puts arrs.find_kth_smallest(15) # => -1

puts arrs.find_kth_smallest(14) # => 10
