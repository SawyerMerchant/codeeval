# https://www.codeeval.com/open_challenges/6/
# You are given two sequences. Write a program to determine the longest common subsequence between the two strings (each string can have a maximum length of 50 characters). NOTE: This subsequence need not be contiguous. The input file may contain empty lines, these need to be ignored.
# INPUT SAMPLE: test.rb
# The first argument will be a path to a filename that contains two strings per line, semicolon delimited. You can assume that there is only one unique subsequence per test case.

def longestcommonsub(file)
  #accept local files and urls
  require 'open-uri'
  require 'pathname'
  if file.start_with?('http')
    file = open(file)
  else
    file = Pathname.new(file)
  end