=begin

Merge Two Sorted Lists

Merge two sorted linked lists and return it as a new list. The new list should be made by splicing together the nodes of the first two lists.

Example:

Input: 1->2->4, 1->3->4
Output: 1->1->2->3->4->4

=end

# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val = 0, _next = nil)
#         @val = val
#         @next = _next
#     end
# end
# @param {ListNode} l1
# @param {ListNode} l2
# @return {ListNode}
def merge_two_lists(l1, l2)
    return l2 unless l1
    return l1 unless l2
    new_head = nil
    
    # 1 -> 2 -> 3
    # 4 -> 5 -> 6
    
    if l1.val <= l2.val
        new_head = l1
        l1 = l1.next
    else
        new_head = l2
        l2 = l2.next
    end
    
    temp = new_head
    
    while l1 && l2
        if l1.val <= l2.val
            temp.next = l1
            temp = l1
            l1 = l1.next
        else
            temp.next = l2
            temp = l2
            l2 = l2.next
        end
    end
    
    while l1
        temp.next = l1
        temp = l1
        l1 = l1.next
    end
    
    while l2
        temp.next = l2
        temp = l2
        l2 = l2.next
    end
    
    return new_head
     
end
