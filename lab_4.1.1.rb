def count_duplicate_groups(arr)
	groups = arr.chunk_while { |a, b| a == b }.to_a
	groups.reject! { |group| group.size == 1 }
	return groups.size
 end
 
 # Приклад використання
 array = [1, 2, 2, 3]
 result = count_duplicate_groups(array)
 puts "Кількість груп повторень в масиві: #{result}"
 