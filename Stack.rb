class Stack

	attr_accessor :array

	def initialize
		# in ruby, array works like stack so we can use array to implement
		@array = Array.new # or simple @array = []
	end

	def push val
		@array.push val
	end

	def pop
		@array.pop
	end

	def top
		@array.last
	end

	def size
		@array.size
	end

	def empty?
		@array.empty?
	end

	def display
		while !empty?
			print " #{top}"
			pop
		end
	end

end

class Test
	def run
		stack = Stack.new
		puts "Stack size is : #{stack.size}"
		puts "is stack empty? : #{stack.empty?}"
		stack.push 10
		stack.push 20
		stack.push 30
		stack.push 40
		stack.push 50
		puts "Stack size is : #{stack.size}"
		puts "is stack empty? : #{stack.empty?}"
		puts "Stack top is : #{stack.top}"
		stack.pop
		stack.pop
		puts "Stack size is : #{stack.size}"
		stack.push 60
		puts "Stack top is : #{stack.top}"
		puts "Stack size is : #{stack.size}"
		print "Stack is :"
		stack.display
	end
end

Test.new.run

=begin
	
Stack size is : 0
is stack empty? : true
Stack size is : 5
is stack empty? : false
Stack top is : 50
Stack size is : 3
Stack top is : 60
Stack size is : 4
Stack is : 60 30 20 10 

=end

