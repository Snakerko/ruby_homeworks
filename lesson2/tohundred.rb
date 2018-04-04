=begin
Заполнить массив числами от 10 до 100 с шагом 5
=end
arr = []
(10..100).each { |v| arr.push(v) if v % 5 == 0 }
puts arr