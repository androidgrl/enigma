require_relative 'test_helper'
require_relative '../lib/decryptor'

class TestDecryptor < Minitest::Test
  def test_it_exists
    assert Decryptor
  end

  def assert_it_decrypts(encrypted, date, key, decrypted)
    return_value = Decryptor.new(encrypted, date, key).decrypt
    assert_equal decrypted, return_value
  end

  def test_it_decrypts_a_string_first
    assert_it_decrypts("2.ql", "030315", "41521", "ruby")
    assert_it_decrypts()
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

    decryptor = Decryptor.new("fevh4peoebuhabtycbs8t,sybbe3 7ms2rys9deydqer te3 7zoc71ztqoot,ykyhep0 04ab", "020315", "13444")
    assert_equal "who is even remotely close to figuring out how to set up the crack feature", decryptor.decrypt

    decryptor = Decryptor.new(",3p41,di5k7p61o98ffz6wbyz7kpr", "030915", "12345")
    assert_equal "testing my encryption engine.", decryptor.decrypt

    decryptor = Decryptor.new(",ids5rz9 o.,2l.h4 24e2. peocp.", "030815", "13772")
    assert_equal "victory to all in 1502 ..end..", decryptor.decrypt

    decryptor = Decryptor.new("4w0 .pxw86 3ud3gub3,dpaaep8383m.1paae9m,x4t", "030915", "55520")
    assert_equal "hello i love you wont you tell me your name", decryptor.decrypt

    decryptor = Decryptor.new("d", "030915", "77509")
    assert_equal " ", decryptor.decrypt

    decryptor = Decryptor.new("8", "030915", "28823")
    assert_equal ",", decryptor.decrypt

    decryptor = Decryptor.new("k", "030915", "05160")
    assert_equal ".", decryptor.decrypt

    decryptor = Decryptor.new("unttvltvvltvvmtvvlstuntvvnttvntvvntvvltvvlt", "030915", "55195")
    assert_equal " ,. . .,. .,...,.    ,.,.,. .,.,.,.,. .,. .", decryptor.decrypt

    decryptor = Decryptor.new("d", "030915", "48223")
    assert_equal "0", decryptor.decrypt

    decryptor = Decryptor.new("8f8ga", "030915", "40751")
    assert_equal "09925", decryptor.decrypt

    decryptor = Decryptor.new("k8160c4zq,ra11cp.s6", "030915", "02823")
    assert_equal "beverly hills 90210", decryptor.decrypt

    decryptor = Decryptor.new("47lu3", "030915", "27959")
    assert_equal "94588", decryptor.decrypt

    decryptor = Decryptor.new("2", "030915", "34319")
    assert_equal "0", decryptor.decrypt

    decryptor = Decryptor.new("c", "030915", "46410")
    assert_equal "1", decryptor.decrypt


    decryptor = Decryptor.new("fcf5f.90f69", "030915", "50469")
    assert_equal "09990504000", decryptor.decrypt

    decryptor = Decryptor.new(",,f ,,f ", "030915", "44944")
    assert_equal "00000000", decryptor.decrypt

    decryptor = Decryptor.new(",ai,e", "030915", "44105")
    assert_equal "09925", decryptor.decrypt

  end
end
