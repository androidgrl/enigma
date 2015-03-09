require_relative 'encryptor'
require_relative 'rotation'
require_relative 'offset'
require_relative 'master_cipher'
require 'pry'

class FileParser
  attr_accessor :message

  def load(filename)
    File.readlines(filename).each do |line|
      self.message = line.to_s.chomp
    end
  end
end

file_parser = FileParser.new
path = File.join(__dir__, ARGV[0])
file_parser.load(path)


rotation = Rotation.new
offset = Offset.new
encryptor = Encryptor.new(file_parser.message, offset.create_offset, rotation.rotation_array)
encrypted_message = encryptor.encrypt
puts encrypted_message


class FileWriter
  def save(filename, encrypted_message)
    File.open(filename, "w") do |file|
      file.puts "#{encrypted_message}"
    end
  end
end

fw = FileWriter.new
saved_file = File.join(__dir__, ARGV[1])
fw.save(saved_file, encrypted_message)
puts "Created #{ARGV[1]} with key #{rotation.key.join} and date #{offset.date}"
