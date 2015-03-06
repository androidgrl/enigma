
letters = ("a".."z").to_a       # => ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]
numbers = ("0".."9").to_a       # => ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
misc = [" ", ".", ","]          # => [" ", ".", ","]
map = letters + numbers + misc  # => ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", " ", ".", ","]
total_map =

atomic 0,19,14,12,8,2

#say index = 38, and shift = 5, so add the two 43 % 39 which is index position 4
# say index = 37, and shift = 5, add the two 42 % 39 which is index position 3

#say index is 0 and shift is 39 then add
#say index is 37 and the shift is 5, than add the two 42 % 39
#say index is 5 and shift is 5, then 10 % 39
#say index is 0 and shift is 1, then 1 % 39
num1 = [1,2,2,37,36]  # => [1, 2, 2, 37, 36]
num2 = [1,2,4,3,3]    # => [1, 2, 4, 3, 3]

index_plus_shift = num1.zip(num2).map do |n,o|  # => [[1, 1], [2, 2], [2, 4], [37, 3], [36, 3]]
  n + o                                         # => 2, 4, 6, 40, 39
end.map do |n|                                  # => [2, 4, 6, 40, 39]
  n % 39                                        # => 2, 4, 6, 1, 0
end                                             # => [2, 4, 6, 1, 0]
