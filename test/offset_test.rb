require_relative 'test_helper'
require_relative '../lib/offset'
require "pry"

class TestOffset < Minitest::Test
  def test_it_exists
    assert Offset
  end

  def test_it_has_a_date_method
    offset_object = Offset.new
    assert offset_object.respond_to?(:date)
  end

  def test_it_can_create_an_integer_date_from_a_date_not_staring_with_zero
    offset_object = Offset.new("120315")

    integer_date = offset_object.integer_date

    assert_equal 120315, integer_date
    assert_equal Fixnum, integer_date.class
  end

  def test_it_can_create_an_integer_date_from_a_date_starting_with_zero
    offset_object = Offset.new("030315")

    integer_date = offset_object.integer_date

    assert_equal 30315, integer_date
    assert_equal Fixnum, integer_date.class
  end

  def test_it_can_create_an_offset_from_a_date_starting_with_zero
    offset_object = Offset.new("022677")

    offset = offset_object.create_offset

    assert_equal [6, 3, 2, 9], offset
    assert_equal Array, offset.class
  end

  def test_it_can_create_an_offset_from_a_date_ending_with_zero
    offset_object = Offset.new("122600")

    offset = offset_object.create_offset

    assert_equal [0, 0, 0, 0], offset
    assert_equal Array, offset.class
  end

  def test_it_can_create_an_offset_from_a_date_neither_starting_nor_ending_with_zero
    offset_object = Offset.new("122601")

    offset = offset_object.create_offset

    assert_equal [5, 2, 0, 1], offset
  end

  def test_it_can_create_an_offset_from_a_default_date
    offset_object = Offset.new

    offset_object.stub :date, "030615" do
      offset = offset_object.create_offset
      assert_equal [8, 2, 2, 5], offset
    end
  end

end
