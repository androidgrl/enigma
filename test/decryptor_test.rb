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

  def test_it_decrypts_a_string
    assert_it_decrypts("2.ql", "030315", "41521", "ruby")

    assert_it_decrypts("nr8", "030315", "41521", "cat")

    assert_it_decrypts("8p6,z03dpka30fbfm46em4h,smk49t3f3fpa6s3ix1awawnxnmg2ng", "030815", "50698", "thanks rachel it was wonderful to work with you..end..")

    assert_it_decrypts("1akwslh0i8rnt3s2fpk1fpywl 1o2eh2w36xzdh5qmrg6h4g1as1fb2gi31niev7feywo3wn0lkpm33xl68g462gi3q0m63gl68g1aog0nxg462gwn3gigngin22qghqmeznl3wnfey203yoflzjk 2gf3hgf3hgf3hgf3huwm2gw.hymksxllihg4ihg4ihg4ihg4ihg3vx1lhxn3mxufk1h5jih5jih5jih5jih5jjvr6j633qqlh5ilhjf.4wf 7nz8s1m33qigu1fcoon4inv9ih", "030815", "43082", "thanks rachel it was wonderful to work with you this is a really long message today was a great day the sun was out and austin helped me lots of spaces                lots of periods................... lots of commas,,,,,,,,,,,,,,,,,,,anyway this was a fun exercise thanks jeff..end..")

    assert_it_decrypts("4qesb7hv77z49pos9bek9aeldq0oacss0p","020315", "13444", "it is all sunshine and butterflies")

    assert_it_decrypts("fevh4peoebuhabtycbs8t,sybbe3 7ms2rys9deydqer te3 7zoc71ztqoot,ykyhep0 04ab", "020315", "13444", "who is even remotely close to figuring out how to set up the crack feature")

    assert_it_decrypts(",3p41,di5k7p61o98ffz6wbyz7kpr", "030915", "12345", "testing my encryption engine.")

    assert_it_decrypts(",ids5rz9 o.,2l.h4 24e2. peocp.", "030815", "13772","victory to all in 1502 ..end..")

    assert_it_decrypts("4w0 .pxw86 3ud3gub3,dpaaep8383m.1paae9m,x4t", "030915", "55520", "hello i love you wont you tell me your name")

    assert_it_decrypts("d", "030915", "77509", " ")

    assert_it_decrypts("8", "030915", "28823", ",")

    assert_it_decrypts("k", "030915", "05160", ".")

    assert_it_decrypts("unttvltvvltvvmtvvlstuntvvnttvntvvntvvltvvlt", "030915", "55195", " ,. . .,. .,...,.    ,.,.,. .,.,.,.,. .,. .")

    assert_it_decrypts("d", "030915", "48223", "0")

    assert_it_decrypts("8f8ga", "030915", "40751", "09925")

    assert_it_decrypts("k8160c4zq,ra11cp.s6", "030915", "02823", "beverly hills 90210")

    assert_it_decrypts("47lu3", "030915", "27959", "94588")

    assert_it_decrypts("2", "030915", "34319", "0")

    assert_it_decrypts("c", "030915", "46410", "1")

    assert_it_decrypts("fcf5f.90f69", "030915", "50469", "09990504000")

    assert_it_decrypts(",,f ,,f ", "030915", "44944", "00000000")

    assert_it_decrypts(",ai,e", "030915", "44105", "09925")

    assert_it_decrypts("qw267x,l m,s,6y771y6pp0s9mx2728778yzimu1v37s7pv2r8rwqnrwcmf2rmx27a887.2zimzo,tr6b622r7rql2,sn9y1,t,m7a887.2zim1ostr7lmu7qt7r78b5f20lc3.l4m62k8168", "030915", "29187", "this is a secret message, do not tell anyone about it. if you do you will face serious consequences. you will have to attend turing for 7 months.")

    assert_it_decrypts("holymof", "030915", "41445", "..end..")
  end

end
