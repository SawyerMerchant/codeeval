# https://www.codeeval.com/open_challenges/24/
# Print out the sum of integers read from a file.

def sumofint(file)
	require 'open-uri'
	require 'pathname'
	if file.start_with?('http')
	  file = open(file)
	else
	  file = Pathname.new(file)
	end
	sum = 0	
	File.foreach(file) do |line|
		sum += line.to_i
	end
	sum
end