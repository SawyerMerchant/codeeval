# https://www.codeeval.com/open_challenges/12/
# Write a program which finds the first non-repeated character in a string.

def firstnon(file)
  require 'open-uri'
  require 'pathname'
  if file.start_with?('http')
    file = open(file)
  else
    file = Pathname.new(file)
  end
  
  def check(arr)
    repeated = []
    arr.each_with_index do |char, index|
      unless arr[(index+1)..-1].include?(char) || repeated.include?(char)
        return char
      end
      repeated << char
    end
  end
  
  File.foreach(file) do |line|
    arr = line.chomp.split("")
    puts check(arr)
  end
end