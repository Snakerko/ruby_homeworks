uname = gets.chomp.capitalize
length = gets.chomp.to_i

def optimal_weight
  weight = length - 110
  weight > 0 ? puts "#{uname} ваш оптимальный вес составляет #{weight} кг." :
  puts "Ваш вес уже оптимальный"
end