class Tree
  attr_accessor :right , :left , :data
  def initialize(d,l,r)
    @right = r
    @left = l
    @data = d
  end 

  def m
end 

test_tree = Tree.new(5,Tree.new(3,Tree.new(1,nil,nil),Tree.new(4,nil,nil)),
        Tree.new(7,Tree.new(6,nil,nil),Tree.new(8,nil,nil)))

