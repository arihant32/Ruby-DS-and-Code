=begin

Write a function to find the longest common prefix string amongst an array of strings.

If there is no common prefix, return an empty string "".

Example 1:

Input: ["flower","flow","flight"]
Output: "fl"
Example 2:

Input: ["dog","racecar","car"]
Output: ""
Explanation: There is no common prefix among the input strings.
Note:

All given inputs are in lowercase letters a-z.

=end

# @param {String[]} strs
# @return {String}
def longest_common_prefix(strs)
    return "" if strs.empty?
    ln = strs[0].size
    str = ""
    
    # finding small length str
    strs.each do |s|
        if s.size <= ln
            ln = s.size
            str = s
        end
    end
    
    prefix_str = ""
    i = 0
    #checking each char in all string to get the prefix
    str.each_char do |c|
        
        flag = false
        
        strs.each do |str|
            if str[i] != c
                flag = true
                break
            end
        end
        
        break if flag
        prefix_str << c
        i = i+1
    end
    
    return prefix_str
    
end
