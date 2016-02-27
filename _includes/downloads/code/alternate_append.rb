class List
	attr_accessor :data, :next 
	def initialize(d,n)
		@data = d
		@next = n
	end

	def display
		tmp = self 
		while !tmp.nil?
			print " #{tmp.data} -> "
			tmp = tmp.next 
		end 
		print " END \n"
	end

	def delete
		if self.next
			self.data = self.next.data 
			self.next = self.next.next 
		end 
	end

	# Uses stack
	def altrev
		h = self
		st = []
		c = 0 
		while !h.next.nil?
			if c%2 == 1
				st.push(h.data)
				h.delete
			else
				h = h.next 
			end
			c += 1 
		end 

		d = nil
		while (d = st.pop)
			h.next = List.new(d,nil)
			h = h.next
		end
	end

	# Stimulates a stack with 'even' pointer
	def altrev_p
		h = self
		even = nil 
		c = 0
		while !h.next.nil?
			if c%2 == 0
				tmp = h.next
				h.next = h.next.next
				if even.nil?
					even = tmp
					even.next = nil
				else 
					tmp.next = even 
					even = tmp 
				end 
			else
				h = h.next
			end
			c += 1
		end
		h.next = even
	end

end 

l = List.new(1,List.new(2,List.new(3,List.new(4,List.new(5,List.new(6,nil))))))
l.display
l.altrev_p
l.display

l = List.new(12,List.new(14,List.new(16,List.new(18,List.new(20,nil)))))
l.display
l.altrev_p
l.display