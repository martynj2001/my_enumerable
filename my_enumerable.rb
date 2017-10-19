# my_enumerable overwrites common enumerable functions

module Enumerable

	def my_each 
		i = 0
		self.length.times do
			yield(self[i])
			i += 1
		end
	end #my_each
		
	def my_each_with_index
		i = 0
		self.length.times do
			yield(self[i], i)	
			i += 1
		end
	end #my_each_index
	
	def my_select
		newArr = []
		self.my_each do |i|
			if yield(i)
				newArr << i
			end
		end
		newArr
	end #my_select
	
	def my_all?
		found = true
			self.my_each do |i|
				if not yield(i)
					found = false
					return found
				end
			end
		found	
	end #my_all?
	
	def my_none?
		none = true
			self.my_each do |i|
				if yield(i)
					none = false
					return found
				end
			end
		none	
	end #my_none?
	
	def my_count num = nil
		counter = 0	
		if block_given?
			self.my_each do |i|
				if yield(i)
					counter += 1
				end
			end
		elsif 
			num == nil
			return self.length
		else
			self.my_each do |i|
				if i == num
					counter += 1
				end
			end
		end
		counter	
	end #my_count
	
	def my_map proc = nil
		newArr = []
		if proc != nil
			self.my_each do |i|
				elm = proc.call(i)
				newArr << elm
				#newArr << yeild(i)
			end
		else
			self.my_each do |i|
				elm = yield(i)
				newArr << elm
			end
		end
		newArr
	end #my_map
	
	def my_inject start = nil
	
		if start != nil
			self.my_each do |i|
				start = yield(start, i)
			end
		else
			start = self[0]
			self.my_each do |i|
				start = yield(start, i)
			end
		end 
		start
	end #my_inject

	def multiply_els array
		array.my_inject{|mult, i| mult * i}
	end #multply_els

end #Enumerable





