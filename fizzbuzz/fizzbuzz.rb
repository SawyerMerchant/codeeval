def fizzbuzz(file)
  #accept local files and urls
  require 'open-uri'
  require 'pathname'
  if file.start_with?('http')
    file = open(file)
  else
    file = Pathname.new(file)
  end
  
  file.read.each_line do |line|
    arr = line.split(" ").map { |s| s.to_i}
    output = ""
    (1..arr[2]).each do |num|
      if num % arr[1] == 0 && num % arr[0] == 0
        output << 'FB '
      elsif num % arr[0] == 0
        output << 'F '
      elsif num % arr[1] == 0
        output << 'B '
      else
        output << num.to_s + " "
      end
    end
    puts output.strip
  end
end