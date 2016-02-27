class Patternizer
	attr_accessor :str1, :str2, :mat

	def initialize(str1,str2)
		@str1 = str1
		@str2 = str2
		@mat = []
	end

	def p_mat 
		(@str1.length+1).times do |i|
			(@str2.length+1).times do |j|
				print " #{@mat[i][j]} "
			end 
			puts ""
		end
	end

	def lc_subsequence
		(@str1.length+1).times do |i|
			@mat[i] = [0]*(@str2.length+1)
		end
		
		@str1.length.times do |i|
			i = i + 1
			@str2.length.times do |j|
				j = j + 1
				if @str1[i-1] == @str2[j-1]
					mat[i][j] = 1 + mat[i-1][j-1]
				else 
					mat[i][j] = [mat[i-1][j],mat[i][j-1]].max
				end 
			end 
		end 
		p_mat
	end
end

pat = Patternizer.new("ABACEB","ADBAVCEB")
pat.lc_subsequence

# Output:
# ------- 
#
 # 0  0  0  0  0  0  0  0  0
 # 0  1  1  1  1  1  1  1  1
 # 0  1  1  2  2  2  2  2  2
 # 0  1  1  2  3  3  3  3  3
 # 0  1  1  2  3  3  4  4  4
 # 0  1  1  2  3  3  4  5  5
 # 0  1  1  2  3  3  4  5  6

