# ruby ./lib/encrypt.rb message.txt encrypted.txt
# Created 'encrypted.txt' with the key 82648 and date 030415
#ruby ./lib/encrypt.rb message.txt encrypted.txt

#refactor rotator, rename it to encryptor
#add decryptor
#private methods

#test file open

# so ruby my_file.rb Arg1 Arg2 Arg3 pizza
# ARGV will be [“Arg1”,”Arg2”,”Arg3”,”pizza”]

path = File.join(__dir__, ARGV[0])
saved = ARGV[1]
File.readlines(path).each do |line|
  puts line
end

doodle = "Saved this encrypted message"

File.open(saved, "w") do |file|
  file.puts "#{doodle}"
end
