=begin

Symmetric Tree

Given a binary tree, check whether it is a mirror of itself (ie, symmetric around its center).

For example, this binary tree [1,2,2,3,4,4,3] is symmetric:

    1
   / \
  2   2
 / \ / \
3  4 4  3
 

But the following [1,2,2,null,3,null,3] is not:

    1
   / \
  2   2
   \   \
   3    3
 

Follow up: Solve it both recursively and iteratively.

=end

# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val = 0, left = nil, right = nil)
#         @val = val
#         @left = left
#         @right = right
#     end
# end
# @param {TreeNode} root
# @return {Boolean}

def symmetric?(t1, t2)
    return false if t1.nil? && t2
    return false if t1 && t2.nil?
    return true  if t1.nil? && t2.nil?
    return false if t1.val != t2.val
    # checking left tree and right if it's mirror or not
    return symmetric?(t1.left, t2.right) && symmetric?(t1.right, t2.left)
end

def is_symmetric(root)
    return true if root.nil?
    # divided tree in two part left tree and right tree
    return symmetric?(root.left, root.right)
end
