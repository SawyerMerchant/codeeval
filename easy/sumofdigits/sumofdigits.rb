# https://www.codeeval.com/open_challenges/21/
# Given a positive integer, find the sum of its constituent digits

def sumofdigits(file)
  require 'open-uri'
  require 'pathname'
  if file.start_with?('http')
    file = open(file)
  else
    file = Pathname.new(file)
  end
  
  File.foreach(file) do |line|
    total = 0
    line.chomp.split("").each do |num|
      total += num.to_i
    end
    p total
  end
end