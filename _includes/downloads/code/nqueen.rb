class ChessBoard 
	attr_accessor :board, :dimension

	def initialize(dimension)
		@board = []
		@dimension = dimension
	end

	def place_nqn
		_place_nqn(0)
	end

	private

	def _place_nqn(k)
		@dimension.times do |i|
			if place_qn?(k,i)
				@board[k] = i
				if k == (@dimension-1)
					board
				else
					_place_nqn(k+1)
				end 
			end 
		end 
	end

	def place_qn?(x,y)
		x.times do |i|
			if x == i or @board[i] == y
				return false
			elsif (@board[i].to_i-y).abs == (x-i).abs
				return false 
			end 
		end 
		return true
	end

	def board
		puts " NEW BOARD "
		@dimension.times do |i|
			print "|"
			@dimension.times do |j|
				if @board[i] == j
					print ' X |'
				else
					print "   |"
				end
			end
			puts ""
		end 
	end

end

cb = ChessBoard.new(4)
cb.place_nqn

# Output:
# ------
#
#  NEW BOARD
# |   | X |   |   |
# |   |   |   | X |
# | X |   |   |   |
# |   |   | X |   |

#  NEW BOARD
# |   |   | X |   |
# | X |   |   |   |
# |   |   |   | X |
# |   | X |   |   |