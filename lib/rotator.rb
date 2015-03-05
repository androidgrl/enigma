class Rotator
  attr_accessor :letter, :offset, :rotation

  def initialize(letter, offset, rotation)
    self.letter = letter
    self.offset = offset
    self.rotation = rotation
  end

  def partial_map
    letters = ("a".."z").to_a
    numbers = ("0".."9").to_a
    misc = [" ", ".", ","]
    letters + numbers + misc
  end

  def full_map
    partial_map * 3
  end

  def letter_index
    full_map.index(self.letter)
  end

  def shift
    self.offset + self.rotation
  end

  def encrypted_letter_index
    letter_index + shift
  end

  def encrypt_letter
    full_map[encrypted_letter_index]
  end


end

rot = Rotator.new("c", 2, 3)
rot.rotation
rot.offset
rot.letter
rot.shift
rot.encrypt_letter
