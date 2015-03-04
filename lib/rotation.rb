class Rotation
  attr_reader :key, :rotation_array

  NUMBERS = %w(0 1 2 3 4 5 6 7 8 9)

  def initialize
    create_key
    create_rotation_array
  end

  def create_key
    @key = []
    5.times do
      @key << NUMBERS.sample
    end
    @key
  end

  def create_rotation_array
    @rotation_array = []
      i = 0
      while i < (key.length - 1)
        @rotation_array << (key[i] + key[i+1])
        i += 1
      end
    @rotation_array = @rotation_array.map {|r| r.to_i }
  end
end

rotation = Rotation.new
rotation.key
rotation.rotation_array
