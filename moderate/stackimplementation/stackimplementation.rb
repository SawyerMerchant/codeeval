# https://www.codeeval.com/open_challenges/9/
# Write a program which implements a stack interface for integers. The interface should have ‘push’ and ‘pop’ functions. Your task is to ‘push’ a series of integers and then ‘pop’ and print every alternate integer.

def stackimplementation(file)
  #accept local files and urls
  require 'open-uri'
  require 'pathname'
  if file.start_with?('http')
    file = open(file)
  else
    file = Pathname.new(file)
  end
  
  File.foreach(file) do |line|
    stack = []
    return_arr = []
    stack = line.chomp.split(" ")
    while stack.any?
      return_arr << stack.pop
      stack.pop if stack.any?
    end
    p return_arr.join(" ")
  end
end


# begin
#     File.open(ARGV[0]).each_line do |line|
#         stack = []
#         return_arr = []
#         stack = line.chomp.split(" ")
#         while stack.any?
#             return_arr << stack.pop
#             stack.pop if stack.any?
#         end
#         p return_arr
#     end
# end