# https://www.codeeval.com/open_challenges/6/
# You are given two sequences. Write a program to determine the longest common subsequence between the two strings (each string can have a maximum length of 50 characters). NOTE: This subsequence need not be contiguous. The input file may contain empty lines, these need to be ignored.
# INPUT SAMPLE: test.rb
# The first argument will be a path to a filename that contains two strings per line, semicolon delimited. You can assume that there is only one unique subsequence per test case.

# This recursive version works but is too slow for longer strings
def longestcommonsub(file)
  #accept local files and urls
  require 'open-uri'
  require 'pathname'
  if file.start_with?('http')
    file = open(file)
  else
    file = Pathname.new(file)
  end
  
  def compare(first, second)
    return "" if first.empty? || second.empty?
    one, one_fam, two, two_fam = first[0..0], first[1..-1], second[0..0], second[1..-1]
    if one == two
      one + compare(one_fam, two_fam)
    else
      [compare(first, two_fam), compare(one_fam, second)].max_by {|m| m.size}
    end
  end
  
  File.foreach(file) do |line|
    line.chomp!
    if !line.empty?
      arr = line.split(";")
      p compare(arr[0], arr[1])
    end
  end
end
