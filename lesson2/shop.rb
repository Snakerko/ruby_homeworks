hash = {}
loop do |k,v,c|
  puts "Введите название товара:"
  k = gets.chomp
  puts "Введите цену товара:"
  v = gets.chomp.to_f
  puts "Введите количество товара:"
  c = gets.chomp.to_i
  hash[k] = { v => c }
  break if k || v || c == "стоп"
end

puts hash