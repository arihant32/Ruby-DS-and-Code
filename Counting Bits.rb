=begin

Counting Bits


Given a non negative integer number num. For every numbers i in the range 0 ≤ i ≤ num calculate the number of 1's in their binary representation and return them as an array.

Example 1:

Input: 2
Output: [0,1,1]
Example 2:

Input: 5
Output: [0,1,1,2,1,2]

=end

# @param {Integer} num
# @return {Integer[]}

def count_bits(num)
    res = []
    # To convert any number to it's binary use num.to_s(2) function
    # To count number of 1's in its binary number use count function like : '1010101'.count('1') => 4
    (num+1).times { |n| res.push(n.to_s(2).count('1')) }
    res
end
