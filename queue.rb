class Queue

	attr_accessor :array

	def initialize
		# in ruby, array can work like queue if we use unshift method
		# unshift method : add object to the front of array/self, moving other elements upwards
		# so will add the element at the front and remove at the end
		# array[0] will be the rear of our queue. array[n] will be the front of the queue.
		@array = Array.new # or simple @array = []
	end

	def enqueue val
		@array.unshift val
	end

	def dequeue
		@array.pop
	end

	def front
		@array.first
	end

	def size
		@array.size
	end

	def empty?
		@array.empty?
	end

	def display
		while !empty?
			print " #{dequeue}"
		end
	end

end

class Test
	def run
		queue = Queue.new
		puts "queue size is : #{queue.size}"
		puts "is queue empty? : #{queue.empty?}"
		queue.enqueue 10
		queue.enqueue 20
		queue.enqueue 30
		queue.enqueue 40
		queue.enqueue 50
		puts "queue size is : #{queue.size}"
		puts "is queue empty? : #{queue.empty?}"
		puts "queue front is : #{queue.front}"
		queue.dequeue
		queue.dequeue
		puts "queue size is : #{queue.size}"
		queue.enqueue 60
		puts "queue front is : #{queue.front}"
		puts "queue size is : #{queue.size}"
		print "queue is :"
		queue.display
	end
end

Test.new.run

=begin

queue size is : 0
is queue empty? : true
queue size is : 5
is queue empty? : false
queue front is : 50
queue size is : 3
queue front is : 60
queue size is : 4
queue is : 30 40 50 60 => nil 
	
=end

