/**
Reverse Linked List

Reverse a singly linked list.

Example:

Input: 1->2->3->4->5->NULL
Output: 5->4->3->2->1->NULL

**/


# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val = 0, _next = nil)
#         @val = val
#         @next = _next
#     end
# end
# @param {ListNode} head
# @return {ListNode}
def reverse_list(head)
    return head unless head && head.next # empty or single node
    prev = nil
    current = head
    while current
        temp = current.next
        current.next = prev
        prev = current
        current = temp
    end
    prev
end
