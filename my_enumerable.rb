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
	
	
	
	
	
	
end #Enumerable