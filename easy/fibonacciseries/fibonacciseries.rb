# https://www.codeeval.com/open_challenges/22/
# The Fibonacci series is defined as: F(0) = 0; F(1) = 1; F(n) = F(n–1) + F(n–2) when n>1. Given an integer n≥0, print out the F(n).

def f(file)
  require 'open-uri'
  require 'pathname'
  if file.start_with?('http')
    file = open(file)
  else
    file = Pathname.new(file)
  end
  
  def fib(num, cacher)
    if num == 1 || num == 0
      return num
    end
    cacher[num] ||= fib(num-1, cacher) + fib(num-2, cacher)
  end
  
  File.foreach(file) do |line|
    num = line.to_i
    cacher = {}
    p fib(num, cacher)
  end
end