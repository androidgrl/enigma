require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/offset'
require "pry"

class TestOffset < Minitest::Test
  def test_it_exists
    assert Offset
  end

  def test_it_has_a_date_method
    offset = Offset.new
    assert offset.respond_to?(:date)
  end

  def test_it_can_create_an_integer_date_from_a_date_not_staring_with_zero
    offset = Offset.new("120315")

    integer_date = offset.integer_date

    assert_equal 120315, integer_date
  end

  def test_it_can_create_an_integer_date_from_a_date_starting_with_zero
    offset = Offset.new("030315")

    integer_date = offset.integer_date

    assert_equal 30315, integer_date
  end

  def test_it_can_create_an_offset_from_a_date_starting_with_zero
    offset = Offset.new("022677")

    offset = offset.create_offset

    assert_equal [6, 3, 2, 9], offset
  end

  def test_it_can_create_an_offset_from_a_date_ending_with_zero
    offset = Offset.new("122600")

    offset = offset.create_offset

    assert_equal [0, 0, 0, 0], offset
  end

  def test_it_can_create_an_offset_from_a_date_neither_starting_nor_ending_with_zero
    offset = Offset.new("122601")
    
    offset = offset.create_offset

    assert_equal [5, 2, 0, 1], offset
  end
end
