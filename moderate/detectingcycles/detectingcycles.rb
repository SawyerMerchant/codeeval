# https://www.codeeval.com/open_challenges/5/
# Given a sequence, write a program to detect cycles within it.
# INPUT SAMPLE:test.rb

def detectingcycles(file)
  #accept local files and urls
  require 'open-uri'
  require 'pathname'
  if file.start_with?('http')
    file = open(file)
  else
    file = Pathname.new(file)
  end
  
  File.foreach(file) do |line|
    arr = line.chomp.split(" ").map {|s| s.to_i }
    return_arr = []
    return_str = ""
    loop do
      last_num = arr.pop
      return_arr.insert(0, last_num)
      return_str.prepend(last_num.to_s + " ")
      break if arr[-1] == return_arr[-1]
    end
      puts return_str.strip
  end
end