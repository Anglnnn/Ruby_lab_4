require 'csv'

class GaussElimination
  def initialize(size)
    @size = size
    @matrix = Array.new(size) { Array.new(size) }
    @vector_b = (1..size).to_a.reverse
    @vector_x = Array.new(size)
  end

  # Метод для введення матриці
  def input_matrix
    puts "Згенерована матриця A:"
    @matrix = Array.new(@size) { Array.new(@size) { |j| rand(@size + 2) } }
  end

  # Метод для виведення матриці A
  def display_matrix
    puts "Матриця A:"
    @size.times { |i| puts @matrix[i].inspect }
  end

  # Метод для виведення вектора b
  def display_vector_b
    puts "Вектор b:"
    puts @vector_b.inspect
  end

  # Метод для розв'язання системи лінійних рівнянь методом Гаусса
  def gauss_elimination
    (0..@size - 1).each do |i|
      pivot = @matrix[i][i]

      (i + 1..@size - 1).each do |j|
        factor = @matrix[j][i] / pivot
        @vector_b[j] -= factor * @vector_b[i]
        (i..@size - 1).each { |k| @matrix[j][k] -= factor * @matrix[i][k] }
      end
    end

    (@size - 1).downto(0).each do |i|
      sum = (i + 1..@size - 1).inject(0) { |s, j| s + @matrix[i][j] * @vector_x[j] }
      @vector_x[i] = (@vector_b[i] - sum) / @matrix[i][i]
    end
  end

  # Метод для виведення розв'язку (вектора x)
  def display_solution
    puts "Вектор невідомих x:" 
    puts @vector_x.inspect
  end

  # Метод для експорту результатів до CSV-файлу
  def export_to_csv(file_path)
    data = [@matrix.flatten, @vector_b, @vector_x].transpose
    header = (1..@size).map { |i| "A#{i}" } + ["b", "x"]
    CSV.open(file_path, "w", write_headers: true, headers: header) do |csv|
      data.each { |row| csv << row }
    end
    puts "Дані експортовано до #{file_path}"
  end
end

# Головна програма
puts "Розв'язання систем лінійних алгебраїчних рівнянь методом Гаусса"

print "Введіть розмірність системи (n): "
size = gets.chomp.to_i

if size < 3 || size > 9
  puts "Розмірність системи має бути в межах [3, 9]."
else
  gauss_solver = GaussElimination.new(size)

  gauss_solver.input_matrix
  gauss_solver.display_matrix

  gauss_solver.display_vector_b

  gauss_solver.gauss_elimination
  gauss_solver.display_solution

  print "Введіть шлях для експорту результатів до CSV: "
  file_path = gets.chomp
  gauss_solver.export_to_csv(file_path)
end
