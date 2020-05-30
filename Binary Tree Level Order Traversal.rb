=begin

Binary Tree Level Order Traversal

Given a binary tree, return the level order traversal of its nodes' values. (ie, from left to right, level by level).

For example:
Given binary tree [3,9,20,null,null,15,7],
    3
   / \
  9  20
    /  \
   15   7
return its level order traversal as:
[
  [3],
  [9,20],
  [15,7]
]

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
# @return {Integer[][]}

def level_order(root)
    result = []
    return result if root.nil?
    queue = Queue.new
    queue.push root
    queue.push nil
    temp = []
    while(!queue.empty?)
        node = queue.pop
        if node.nil?
            result.push temp
            temp = []
            break if queue.empty?
            queue.push nil  
        else
            temp.push node.val
            queue.push node.left if node.left
            queue.push node.right if node.right
        end
    end
    return result
end
