=begin

Given a singly linked list, determine if it is a palindrome.

Example 1:

Input: 1->2
Output: false
Example 2:

Input: 1->2->2->1
Output: true
Follow up:
Could you do it in O(n) time and O(1) space?

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
# @return {Boolean}
def get_no_of_nodes temp
    count = 0
    while temp
        count += 1
        temp = temp.next
    end
    return count
end

def is_palind? head1, head2
    while head1 && head2
        if head1.val != head2.val
            return false
        end
        head1 = head1.next
        head2 = head2.next
    end
    true
end
    
def is_palindrome(head)
    return true unless head && head.next
    count = get_no_of_nodes(head)
    is_odd = count.odd?
    half = count/2
    prev = nil
    current = head
    
    while half > 0
        temp = current.next
        current.next = prev
        prev = current
        current = temp
        half -= 1
    end
    
    current = current.next if is_odd
    
    return is_palind?(prev, current)

end
