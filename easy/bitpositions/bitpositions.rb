# https://www.codeeval.com/open_challenges/19/
# Given a number n and two integers p1,p2 determine if the bits in position p1 and p2 are the same or not. Positions p1 and p2 are 1 based.

def bitpositions(file)
  #accept local files and urls
  require 'open-uri'
  require 'pathname'
  if file.start_with?('http')
    file = open(file)
  else
    file = Pathname.new(file)
  end
  
  def bitvalue(num, pos)
    (num % (2**pos)) / 2**(pos-1)
  end
  
  File.foreach(file) do |line|
    arr = line.chomp.split(",")
    num = arr[0].to_i
    p1 = arr[1].to_i
    p2 = arr[2].to_i
    
    puts bitvalue(num, p1) == bitvalue(num, p2)
  end
  # p 86.to_s(2)
  # p 8.to_s(2)
  # p 6.to_s(2)
end