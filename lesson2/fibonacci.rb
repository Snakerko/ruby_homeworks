=begin
Заполнить массив числами фибоначи до 100
=end

def fib(n)
  if n < 3
    1
  else
    fib(n - 1) + fib(n - 2)
  end
end
arr = []
(1..11).each { |n| arr.push(fib(n)) }
puts arr