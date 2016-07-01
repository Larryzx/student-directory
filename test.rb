#require 'File'
#Write a programe that writes out its own source code
# name of file _FILE_ in here apparently
#read the file name returned line by line and out put that to the screen
#The name of the file currently being executed, including path
#relative to the directory where the application was started up
#(or the current directory, if it has been changed).
#puts __FILE__
filename =  __FILE__
File.open(filename,"r") do |filehandle|
  filehandle.readlines.each do |line|
    puts line
  end 
end   
puts "Outputs its own source code question 8"