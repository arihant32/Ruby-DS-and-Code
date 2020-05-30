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

	def insert node = nil, val
		if @root.nil?
			@root = get_new_node val 
			return @root
		end
		if val < node.val
			if node.left.nil?
				node.left = get_new_node val
			else
				insert node.left, val
			end	
		else
			if node.right.nil?
				node.right = get_new_node val
			else
				insert node.right, val
			end	
		end
		return node
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

	private

	def get_new_node val
		TreeNode.new val
	end

end

class Test

	def run
		bst = BST.new
		bst.insert(bst.root, 5)
		bst.insert(bst.root, 3)
		bst.insert(bst.root, 7)
		bst.insert(bst.root, 2)
		bst.insert(bst.root, 4)
		bst.insert(bst.root, 6)
		bst.insert(bst.root, 8)
		puts "\n inorder is : "
		bst.inorder bst.root
		puts "\n preorder is : "
		bst.preorder bst.root
		puts "\n postorder is : "
		bst.postorder bst.root
	end

end

