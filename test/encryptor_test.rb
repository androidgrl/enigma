require_relative 'test_helper'
require_relative '../lib/encryptor'

class TestEncryptor < Minitest::Test
  def test_it_exists
    assert Encryptor
  end

  def test_it_takes_in_a_string_and_splits_it
    enc = Encryptor.new
    assert_equal ["a", "t", "o", "m", "i", "c"], enc.string
  end

  def test_it_has_an_offset_attribute_that_is_a_four_element_array
    enc = Encryptor.new
    assert_equal [1, 1, 1, 1], enc.offset
    assert_equal 4, enc.offset.length
  end

  def test_it_has_a_rotation_attribute_that_is_a_four_element_array
    enc = Encryptor.new
    assert_equal [2,2,2,2], enc.rotation
    assert_equal 4, enc.rotation.length
  end

  def test_it_can_have_a_new_offset
    enc = Encryptor.new("blondie", [9,2,2,5])
    assert_equal [9,2,2,5], enc.offset
    assert_equal 4, enc.offset.length
  end

  def test_it_can_have_a_new_rotation
    enc = Encryptor.new("blondie", [9,2,2,5], [8,0,0,8])
    assert_equal [8,0,0,8], enc.rotation
    assert_equal 4, enc.rotation.length
  end

  def assert_it_encrypts(message, offset, rotation, encrypted)
    return_value = Encryptor.new(message, offset, rotation).encrypt
    assert_equal encrypted, return_value
  end

  def test_it_can_encrypt_a_string
    assert_it_encrypts("it is all sunshine and butterflies", [9,2,2,5], [13,34,44,44], "4qesb7hv77z49pos9bek9aeldq0oacss0p")

    assert_it_encrypts("ruby", [9,2,2,5], [41,15,52,21], "2.ql")

    assert_it_encrypts("cat", [9,2,2,5], [41,15,52,21], "nr8")

    assert_it_encrypts( "thanks rachel it was wonderful to work with you..end..", [4,2,2,5], [50,6,69,98], "8p6,z03dpka30fbfm46em4h,smk49t3f3fpa6s3ix1awawnxnmg2ng")

    assert_it_encrypts("thanks rachel it was wonderful to work with you this is a really long message today was a great day the sun was out and austin helped me lots of spaces                lots of periods................... lots of commas,,,,,,,,,,,,,,,,,,,anyway this was a fun exercise thanks jeff..end..", [4,2,2,5], [43,30,8,82], "1akwslh0i8rnt3s2fpk1fpywl 1o2eh2w36xzdh5qmrg6h4g1as1fb2gi31niev7feywo3wn0lkpm33xl68g462gi3q0m63gl68g1aog0nxg462gwn3gigngin22qghqmeznl3wnfey203yoflzjk 2gf3hgf3hgf3hgf3huwm2gw.hymksxllihg4ihg4ihg4ihg4ihg3vx1lhxn3mxufk1h5jih5jih5jih5jih5jjvr6j633qqlh5ilhjf.4wf 7nz8s1m33qigu1fcoon4inv9ih")

    assert_it_encrypts("it is all sunshine and butterflies", [9,2,2,5], [13,34,44,44], "4qesb7hv77z49pos9bek9aeldq0oacss0p")

    assert_it_encrypts("who is even remotely close to figuring out how to set up the crack feature", [9,2,2,5], [13,34,44,44], "fevh4peoebuhabtycbs8t,sybbe3 7ms2rys9deydqer te3 7zoc71ztqoot,ykyhep0 04ab")

    assert_it_encrypts("testing my encryption engine.", [7,2,2,5], [12,23,34,45], ",3p41,di5k7p61o98ffz6wbyz7kpr")

    assert_it_encrypts("victory to all in 1502 ..end..", [4,2,2,5], [13,37,77,72], ",ids5rz9 o.,2l.h4 24e2. peocp.")

    assert_it_encrypts(" ", [7,2,2,5], [77,75,50,9], "d")

    assert_it_encrypts(",", [7,2,2,5], [28,88,82,23], "8")

    assert_it_encrypts(".", [7,2,2,5], [5,51,16,60], "k")

    assert_it_encrypts(" ,. . .,. .,...,.    ,.,.,. .,.,.,.,. .,. .", [7,2,2,5], [55,51,19,95], "unttvltvvltvvmtvvlstuntvvnttvntvvntvvltvvlt")

    assert_it_encrypts("0", [7,2,2,5], [48,82,22,23], "d")

    assert_it_encrypts("09925", [7,2,2,5], [40,7,75,51], "8f8ga")

    assert_it_encrypts("beverly hills 90210", [7,2,2,5], [2,28,82,23], "k8160c4zq,ra11cp.s6")

    assert_it_encrypts("94588", [7,2,2,5], [27,79,95,59], "47lu3")

    assert_it_encrypts("0", [7,2,2,5], [34,43,31,19], "2")

    assert_it_encrypts("1", [7,2,2,5], [46,64,41,10], "c")

    assert_it_encrypts("09990504000", [7,2,2,5], [50,4,46,69], "fcf5f.90f69")

    assert_it_encrypts( "00000000", [7,2,2,5], [44,49,94,44], ",,f ,,f ")

    assert_it_encrypts("09925", [7,2,2,5], [44,41,10,5], ",ai,e")

    assert_it_encrypts("this is a secret message, do not tell anyone about it. if you do you will face serious consequences. you will have to attend turing for 7 months.", [7,2,2,5], [29,91,18,87], "qw267x,l m,s,6y771y6pp0s9mx2728778yzimu1v37s7pv2r8rwqnrwcmf2rmx27a887.2zimzo,tr6b622r7rql2,sn9y1,t,m7a887.2zim1ostr7lmu7qt7r78b5f20lc3.l4m62k8168")

    assert_it_encrypts( "..end..", [7,2,2,5], [41,14,44,45], "holymof")
  end

end
