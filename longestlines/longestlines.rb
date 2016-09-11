# https://www.codeeval.com/open_challenges/2/
# Write a program which reads a file and prints to stdout the specified number of the longest lines that are sorted based on their length in descending order.
# INPUT SAMPLE:
# Your program should accept a path to a file as its first argument. The file contains multiple lines. The first line indicates the number of lines you should output, the other lines are of different length and are presented randomly. You may assume that the input file is formatted correctly and the number in the first line is a valid positive integer.
# For example: test.rb


def longestlines(file)
  #accept local files and urls
  require 'open-uri'
  require 'pathname'
  if file.start_with?('http')
    file = open(file)
  else
    file = Pathname.new(file)
  end
  number_of_returns = File.foreach(file).first().chomp.to_i - 1
  arr = []
  File.foreach(file) do |line|
    arr << line.chomp
  end
  arr = arr.sort_by {|x| x.length}.reverse
  arr[0..number_of_returns].each {|x| puts x}
end


#for their editor
# begin
#   number_of_returns = File.open(ARGV[0]).first().chomp.to_i - 1
#   arr = []
#   File.foreach(ARGV[0]) do |line|
#     arr << line.chomp
#   end
#   arr = arr.sort_by {|x| x.length}.reverse
#   arr[0..number_of_returns].each {|x| puts x}
# end