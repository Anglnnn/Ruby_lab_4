class MatrixOperations
	def self.scalar_multiply(matrix, scalar)
	  matrix.map { |row| row.map { |elem| elem * scalar } }
	end
 
	def self.matrix_addition(matrix_a, matrix_b)
	  matrix_a.zip(matrix_b).map { |row_a, row_b| row_a.zip(row_b).map { |a, b| a + b } }
	end
 
	def self.transpose(matrix)
	  matrix.transpose
	end
 
	def self.matrix_multiply(matrix_a, matrix_b)
	  matrix_a.map do |row|
		 row.map do |elem_a|
			matrix_b.transpose.map { |col| col.map { |elem_b| elem_a * elem_b } }.transpose.map(&:sum)
		 end.transpose.map(&:sum)
	  end
	end
 
	def self.trace(matrix)
	  matrix.each_with_index.map { |row, i| row[i] }.sum
	end
 
	def self.inner_product(vector_x, vector_y)
	  vector_x.zip(vector_y).map { |x, y| x * y }.sum
	end
 
	def self.outer_product(vector_x, vector_y)
	  vector_x.map { |x| vector_y.map { |y| x * y } }
	end
 
	def self.vector_norm(vector)
	  Math.sqrt(vector.map { |elem| elem**2 }.sum)
	end
 
	def self.column_vector_multiply(vector, matrix)
	  matrix.transpose.map { |row| inner_product(vector, row) }
	end
 
	def self.row_vector_multiply(vector, matrix)
	  matrix.map { |row| inner_product(vector, row) }
	end
 end
 
 # Приклад використання
 n = 8
 matrix_a = Array.new(n) { Array.new(n) { rand(10) } }
 matrix_b = Array.new(n) { Array.new(n) { rand(10) } }
 vector_x = Array.new(n) { rand(10) }
 vector_y = Array.new(n) { rand(10) }
 
 result = MatrixOperations.scalar_multiply(matrix_b, 2)
 puts "1. Умноження матриці B на число 2:"
 puts result.inspect
 
 result = MatrixOperations.matrix_addition(matrix_a, matrix_b)
 puts "2. Сума матриць A та B:"
 puts result.inspect
 
 result = MatrixOperations.transpose(matrix_a)
 puts "3. Транспонування матриці A:"
 puts result.inspect
 
 result = MatrixOperations.matrix_multiply(matrix_a, matrix_b)
 puts "4. Добуток матриці A на матрицю B:"
 puts result.inspect
 
 result = MatrixOperations.trace(matrix_b)
 puts "5. Слід матриці B:"
 puts result
 
 result = MatrixOperations.inner_product(vector_x, vector_y)
 puts "6. Внутрішній (скалярний) добуток векторів X та Y:"
 puts result
 
 result = MatrixOperations.outer_product(vector_x, vector_y)
 puts "7. Зовнішній добуток векторів X та Y:"
 puts result.inspect
 
 result = MatrixOperations.vector_norm(vector_x)
 puts "8. Норма вектора X:"
 puts result
 
 result = MatrixOperations.column_vector_multiply(vector_x, matrix_a)
 puts "9. Добуток вектор-стовпця X на матрицю A:"
 puts result.inspect
 
 result = MatrixOperations.row_vector_multiply(vector_y, matrix_b)
 puts "10. Добуток вектор-рядка Y на матрицю B:"
 puts result.inspect
 