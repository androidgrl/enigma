require_relative 'test_helper'
require_relative '../lib/decryptor'

class TestDecryptor < Minitest::Test
  def test_it_exists
    assert Decryptor
  end

  def assert_it_decrypts(encrypted, date, key, decrypted)
    assert_equal decrypted, Decryptor.new(encrypted, date, key).decrypt
  end

  def test_it_decrypts_a_string
    assert_it_decrypts("2.ql", "030315", "41521", "ruby")
  end

  def test_it_decrypts_a_string
    decryptor = Decryptor.new("2.ql", "030315", "41521")
    assert_equal "ruby", decryptor.decrypt

    decryptor = Decryptor.new("nr8", "030315", "41521")
    assert_equal "cat", decryptor.decrypt

    decryptor = Decryptor.new("8p6,z03dpka30fbfm46em4h,smk49t3f3fpa6s3ix1awawnxnmg2ng", "030815", "50698")
    assert_equal "thanks rachel it was wonderful to work with you..end..", decryptor.decrypt

    decryptor = Decryptor.new("1akwslh0i8rnt3s2fpk1fpywl 1o2eh2w36xzdh5qmrg6h4g1as1fb2gi31niev7feywo3wn0lkpm33xl68g462gi3q0m63gl68g1aog0nxg462gwn3gigngin22qghqmeznl3wnfey203yoflzjk 2gf3hgf3hgf3hgf3huwm2gw.hymksxllihg4ihg4ihg4ihg4ihg3vx1lhxn3mxufk1h5jih5jih5jih5jih5jjvr6j633qqlh5ilhjf.4wf 7nz8s1m33qigu1fcoon4inv9ih", "030815", "43082")
    assert_equal "thanks rachel it was wonderful to work with you this is a really long message today was a great day the sun was out and austin helped me lots of spaces                lots of periods................... lots of commas,,,,,,,,,,,,,,,,,,,anyway this was a fun exercise thanks jeff..end..", decryptor.decrypt

    decryptor = Decryptor.new("4qesb7hv77z49pos9bek9aeldq0oacss0p","020315", "13444")
    assert_equal "it is all sunshine and butterflies", decryptor.decrypt

    # decryptor = Decryptor.new("7vm0w2mapvsx45m6pmfz3txv564l4m1m7m04os0pxt4", "020315", "10098")
    # assert_equal "hello world", decryptor.decrypt

    decryptor = Decryptor.new("fevh4peoebuhabtycbs8t,sybbe3 7ms2rys9deydqer te3 7zoc71ztqoot,ykyhep0 04ab", "020315", "13444")
    assert_equal "who is even remotely close to figuring out how to set up the crack feature", decryptor.decrypt
  end
end
