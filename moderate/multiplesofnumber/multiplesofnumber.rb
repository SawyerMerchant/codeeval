# https://www.codeeval.com/open_challenges/18/
# Given numbers x and n, where n is a power of 2, print out the smallest multiple of n which is greater than or equal to x. Do not use division or modulo operator.
# INPUT SAMPLE:test.rb
# The first argument will be a path to a filename containing a comma separated list of two integers, one list per line. E.g.


def multiplesofnumber(file)
  #accept local files and urls
  require 'open-uri'
  require 'pathname'
  if file.start_with?('http')
    file = open(file)
  else
    file = Pathname.new(file)
  end
  
  file.read.each_line do |line|
    arr = line.split(",").map { |s| s.to_i }
    adder = arr[1]
    if arr[1] == 1
      puts arr[0]
    else
      while arr[1] < arr[0] do
        arr[1] = arr[1] + adder
      end
      puts arr[1]
    end
  end
end