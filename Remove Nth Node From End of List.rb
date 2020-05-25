=begin

Remove Nth Node From End of List

Given a linked list, remove the n-th node from the end of list and return its head.

Example:

Given linked list: 1->2->3->4->5, and n = 2.

After removing the second node from the end, the linked list becomes 1->2->3->5.
Note:

Given n will always be valid.

Follow up:

Could you do this in one pass?

=end

# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val = 0, _next = nil)
#         @val = val
#         @next = _next
#     end
# end
# @param {ListNode} head
# @param {Integer} n
# @return {ListNode}
def remove_nth_from_end(head, n)
    return head unless head
    current = prev = head
    prev_prev = nil
    # the idea is maintain two pointers and update one with a delay of n steps.
    while current
        if n <= 0
            prev_prev = prev
            prev = prev.next 
        end
        current = current.next
        n -= 1
    end
    
    # that means need to deleted first node, n might be total number of node in the list
    if prev_prev.nil?
        return prev.next
    else
        # that means prev position node needs to be deleted
        prev_prev.next = prev.next
    end
    head
end
