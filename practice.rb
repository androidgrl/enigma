
# letters = ("a".."z").to_a
# numbers = ("0".."9").to_a
# misc = [" ", ".", ","]
# map = letters + numbers + misc
# total_map =
#
# atomic 0,19,14,12,8,2
#
# #say index = 38, and shift = 5, so add the two 43 % 39 which is index position 4
# # say index = 37, and shift = 5, add the two 42 % 39 which is index position 3
#
# #say index is 0 and shift is 39 then add
# #say index is 37 and the shift is 5, than add the two 42 % 39
# #say index is 5 and shift is 5, then 10 % 39
# #say index is 0 and shift is 1, then 1 % 39
# num1 = [1,2,2,37,36]
# num2 = [1,2,4,3,3]
#
# index_plus_shift = num1.zip(num2).map do |n,o|
#   n + o
# end.map do |n|
#   n % 39
# end
#
# "ruby" encrpyted with 41,15,52,21 and 9225 -> "2.ql"
somefile = File.open("sample.txt", "w")
somefile.puts "Hello file!"
somefile.close
