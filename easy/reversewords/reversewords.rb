# https://www.codeeval.com/open_challenges/8/
# Write a program which reverses the words in an input sentence.

def reversewords(file)
  #accept local files and urls
  require 'open-uri'
  require 'pathname'
  if file.start_with?('http')
    file = open(file)
  else
    file = Pathname.new(file)
  end
  
  File.foreach(file) do |line|
    arr = line.split(" ")
    return_string = ""
    until arr.empty? do
      return_string += arr.pop + " "
    end
    puts return_string.chomp
  end
end