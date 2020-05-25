class ListNode

	#it will automatically create setter and geter methods for data & node
	attr_accessor :data, :next

	def initialize(data = nil, nxt = nil)
		@data = data
		@next = nxt
	end

end

class LinkedList

	def initialize
		@head = nil
	end

	def size
		count = 0
		temp = @head
		while(temp)
			count += 1
			temp = temp.next
		end
		count
	end

	def empty?
		size == 0 ? true : false
	end

	def display
		temp = @head
		if temp.nil?
			print "Empty."
			return
		end
		while(temp)
			print "#{temp.data} -->"
			temp = temp.next
		end
	end

	def add_at_begging val
		if @head.nil?
			@head = get_new_node(val)
		else
			temp = get_new_node(val)
			temp.next = @head
			@head = temp
		end
	end

	def add_at_end val
		if @head.nil?
			@head = get_new_node(val)
		else
			iterator = @head
			while iterator.next
				iterator = iterator.next
			end
			iterator.next = get_new_node(val)
		end
	end

	def remove_at_begging
		return if @head.nil?
		temp = @head
		@head = temp.next
		# clearing it like free or delete in c/c++ 
		# in ruby, garbage collector will take care for freeing memory
		temp = nil
	end

	def remove_at_end
		return if @head.nil?
		temp = @head
		prev = nil
		while temp.next
			prev = temp
			temp = temp.next
		end
		prev.next = nil
		# clearing it like free or delete in c/c++ 
		temp = nil
	end

	def add_at_position position, val
		return if position > size || position <= 1
		iterator = @head
		prev = nil
		while position > 1
			prev = iterator
			iterator = iterator.next
			position -= 1
		end
		new_node = get_new_node(val)
		prev.next = new_node
		new_node.next = iterator
	end

	private

	def get_new_node val = nil
		ListNode.new(val)
	end

end

class Test

	def run
		obj = LinkedList.new
		puts obj.display
		puts "List size is : #{obj.size}"
		puts "Is list empty? : #{obj.empty?}"
		obj.add_at_begging 5
		obj.add_at_begging 4
		obj.add_at_begging 3
		obj.add_at_begging 2
		obj.add_at_begging 1
		obj.add_at_end 6
		obj.add_at_end 7
		obj.add_at_end 8
		obj.add_at_position 3, 99
		obj.add_at_position 5, 100
		puts obj.display
		puts "List size is : #{obj.size}"
		puts "Is list empty? : #{obj.empty?}"
		obj.remove_at_begging
		obj.remove_at_end
		puts "List size is : #{obj.size}"
		puts obj.display
	end

end

Test.new.run

=begin

Empty.
List size is : 0
Is list empty? : true
1 -->2 -->99 -->3 -->100 -->4 -->5 -->6 -->7 -->8 -->
List size is : 10
Is list empty? : false
List size is : 8
2 -->99 -->3 -->100 -->4 -->5 -->6 -->7 -->
 
=end
