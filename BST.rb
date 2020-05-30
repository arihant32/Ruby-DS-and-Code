class TreeNode
	attr_accessor :val, :left, :right

	def initialize _val = nil, _left = nil, _right = nil
		@val = _val
		@left = _left
		@right = _right
	end

end

class BST

	attr_accessor :root

	def initialize
		@root = nil
	end

	def _insert node = nil, val
		return get_new_node val if node.nil?
		if val < node.val
			node.left = _insert node.left, val
		else
			node.right = _insert node.right, val
		end
		return node
	end

	def insert val
		if @root.nil?
			@root = get_new_node val 
			return @root
		end
		_insert @root, val	
	end

	def inorder root
		return unless root
		inorder root.left
		print "#{root.val} "
		inorder root.right
	end

	def preorder root
		return unless root
		print "#{root.val} "
		preorder root.left
		preorder root.right
	end

	def postorder root
		return unless root
		postorder root.left
		postorder root.right
		print "#{root.val} "
	end

	def level_order root

	end

	def search val

	end

	def size

	end

	private

	def get_new_node val
		TreeNode.new val
	end

end

class Test

	def run
		bst = BST.new
		bst.insert 5
		bst.insert 3
		bst.insert 7
		bst.insert 2
		bst.insert 4
		bst.insert 6
		bst.insert 8
		puts "\n inorder is : "
		bst.inorder bst.root
		puts "\n preorder is : "
		bst.preorder bst.root
		puts "\n postorder is : "
		bst.postorder bst.root
	end

end

Test.new.run

=begin
 inorder is : 
2 3 4 5 6 7 8 
 preorder is : 
5 3 2 4 7 6 8 
 postorder is : 
2 4 3 6 8 7 5 
=end
2.4.7 :1686 > 
