require_relative 'test_helper'
require_relative '../lib/rotation'
require "pry"

class TestRotation < Minitest::Test
  attr_accessor :rotation

  def setup
    @rotation = Rotation.new
  end

  def test_it_has_a_key_that_is_five_elements_long
    assert_equal 5, rotation.key.length
  end

  def test_it_has_a_key_whose_elements_are_included_in_the_range_zero_through_nine
    numbers = %w(0 1 2 3 4 5 6 7 8 9)
    only_1_through_9 = rotation.key.all?{|k| numbers.include?(k)}
    assert only_1_through_9
  end

  def test_it_can_generate_an_array_of_four_rotations
    assert_equal 4, rotation.rotation_array.length
  end

  def test_it_can_generate_the_first_rotation_from_the_key
    rotation.stub :key, ["1", "2", "3", "4", "5"] do
      rotation.create_rotation_array
      assert_equal 12, rotation.rotation_array[0]
    end
  end

  def test_it_can_generate_the_second_rotation_from_the_key
    rotation.stub :key, ["1", "2", "3", "4", "5"] do
      rotation.create_rotation_array
      assert_equal 23, rotation.rotation_array[1]
    end
  end

  def test_it_can_generate_the_third_rotation_from_the_key
    rotation.stub :key, ["1", "2", "3", "4", "5"] do
      rotation.create_rotation_array
      assert_equal 34, rotation.rotation_array[2]
    end
  end

  def test_it_can_generate_the_fourth_rotation_from_the_key
    rotation.stub :key, ["1", "2", "3", "4", "5"] do
      rotation.create_rotation_array
      assert_equal 45, rotation.rotation_array[3]
    end
  end

  def test_it_creates_rotations
    rotation = Rotation.new("41521")
    rotation_array = rotation.create_rotation_array
    assert_equal 4, rotation_array.length
    assert_equal 41, rotation_array[0]
    assert_equal 15, rotation_array[1]
    assert_equal 52, rotation_array[2]
    assert_equal 21, rotation_array[3]
  end

  def test_it_creates_rotations_with_zeros
    rotation = Rotation.new("04810")
    rotation_array = rotation.create_rotation_array
    assert_equal 4, rotation_array.length
    assert_equal 4, rotation_array[0]
    assert_equal 48, rotation_array[1]
    assert_equal 81, rotation_array[2]
    assert_equal 10, rotation_array[3]
  end

  def test_it_creates_rotations_with_all_zeros
    rotation = Rotation.new("00000")
    rotation_array = rotation.create_rotation_array
    assert_equal 4, rotation_array.length
    assert_equal 0, rotation_array[0]
    assert_equal 0, rotation_array[1]
    assert_equal 0, rotation_array[2]
    assert_equal 0, rotation_array[3]
  end

  def test_it_creates_rotations_with_all_nines
    rotation = Rotation.new("99999")
    rotation_array = rotation.create_rotation_array
    assert_equal 4, rotation_array.length
    assert_equal 99, rotation_array[0]
    assert_equal 99, rotation_array[1]
    assert_equal 99, rotation_array[2]
    assert_equal 99, rotation_array[3]
  end

end
