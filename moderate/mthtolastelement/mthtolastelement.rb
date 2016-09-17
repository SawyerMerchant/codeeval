# https://www.codeeval.com/open_challenges/10/
# Write a program which determines the Mth to the last element in a list.

def mthtolast(file)
  require 'open-uri'
  require 'pathname'
  if file.start_with?('http')
    file = open(file)
  else
    file = Pathname.new(file)
  end
  
  File.foreach(file) do |line|
    arr = line.split(" ")
    mth = arr.pop
    puts arr[-mth.to_i]
  end
end