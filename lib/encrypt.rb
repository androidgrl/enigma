require_relative 'rotator'
require_relative 'rotation'
require_relative 'offset'
require 'pry'

class FileParser
  attr_accessor :message

  def load(filename)
    File.readlines(filename).each do |line|
      self.message = line.to_s.chomp
    end
  end
end

fp = FileParser.new
path = File.join(__dir__, ARGV.shift)
fp.load(path)

class Encryptor
  attr_accessor :rotator

  def initialize(rotator)
    @rotator = rotator
  end

  def encrypt
    "#{@rotator.encrypt}"
  end
end

rotator = Rotator.new(fp.message, Offset.new.create_offset, Rotation.new.rotation_array)
encr = Encryptor.new(rotator)
puts encr.encrypt
