# https://www.codeeval.com/open_challenges/6/
# You are given two sequences. Write a program to determine the longest common subsequence between the two strings (each string can have a maximum length of 50 characters). NOTE: This subsequence need not be contiguous. The input file may contain empty lines, these need to be ignored.
# INPUT SAMPLE: test.rb
# The first argument will be a path to a filename that contains two strings per line, semicolon delimited. You can assume that there is only one unique subsequence per test case.

# 

class LCS
  SELF, LEFT, UP, DIAG = [0,0], [0,-1], [-1,0], [-1,-1]
 
  def initialize(a, b)
    @m = Array.new(a.length) { Array.new(b.length) }
    a.each_char.with_index do |x, i|
      b.each_char.with_index do |y, j|
        match(x, y, i, j)
      end
    end
  end
 
  def match(c, d, i, j)
    @i, @j = i, j
    @m[i][j] = compute_entry(c, d)
  end
 
  def lookup(x, y)        [@i+x, @j+y]                      end
  def valid?(i=@i, j=@j)  i >= 0 && j >= 0                  end
 
  def peek(x, y)
    i, j = lookup(x, y)
    valid?(i, j) ? @m[i][j] : 0
  end 
 
  def compute_entry(c, d)
    c == d ? peek(*DIAG) + 1 : [peek(*LEFT), peek(*UP)].max
  end
 
  def backtrack
    @i, @j = @m.length-1, @m[0].length-1
    y = []
    y << @i+1 if backstep? while valid?
    y.reverse
  end
 
  def backtrack2
    @i, @j = @m.length-1, @m[0].length-1
    y = []
    y << @j+1 if backstep? while valid?
    [backtrack, y.reverse]
  end
 
  def backstep?
    backstep = compute_backstep
    @i, @j = lookup(*backstep)
    backstep == DIAG
  end
 
  def compute_backstep
    case peek(*SELF)
    when peek(*LEFT) then LEFT
    when peek(*UP)   then UP
    else                  DIAG
    end
  end
end
 
def lcs(a, b)
  walker = LCS.new(a, b)
  walker.backtrack.map{|i| a[i]}.join
end



def longestcommonsub(file)
  #accept local files and urls
  require 'open-uri'
  require 'pathname'
  if file.start_with?('http')
    file = open(file)
  else
    file = Pathname.new(file)
  end
  
  # def compare(first, second)
    
  # end
  
  File.foreach(file) do |line|
    line.chomp!
    if !line.empty?
      arr = line.split(";")
      puts lcs(arr[0], arr[1])#.sub(/\s+\Z/, "")
    end
  end
end
