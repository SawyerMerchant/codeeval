# https://www.codeeval.com/open_challenges/11/
# Write a program to determine the lowest common ancestor of two nodes in a binary search tree. You may hardcode the following binary search tree in your program:

def lowestcommonancestor(file)
  require 'open-uri'
  require 'pathname'
  if file.start_with?('http')
    file = open(file)
  else
    file = Pathname.new(file)
  end
  
  def lookup(red, blue)
    tree = {
    30 => [30],
    8 => [30],
    52 => [30],
    3 => [8, 30],
    20 => [8, 30],
    10 => [20, 8, 30],
    29 => [20, 8, 30]
    }
    return blue if tree[red].include?(blue)
    return red if tree[blue].include?(red)
    
    common = tree[red] & tree[blue]
    return common[0]
  end
  
  File.foreach(file) do |line|
    arr = line.split(" ")
    red = arr[0].to_i
    blue = arr[1].to_i
    p lookup(red, blue)
  end
end