=begin
Заполнить хэш гласными буквами, где значением будет являться порядковый номер буквы в алфавите ( а - 1)
=end
chars = 'a'..'z'
vowels = ['a','e','i','o','u']
hash = {}
chars.each_with_index { |k,v| hash[k] = v+1 if vowels.include?(k) }
hash.each { |k,v| puts "(#{k} - #{v})" }