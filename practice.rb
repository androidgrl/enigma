
letters = ("a".."z").to_a       # => ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]
numbers = ("0".."9").to_a       # => ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
misc = [" ", ".", ","]          # => [" ", ".", ","]
map = letters + numbers + misc  # => ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", " ", ".", ","]
total_map =


#say index = 38, and shift = 5, so add the two 43 % 39 which is index position 4
# say index = 37, and shift = 5, add the two 42 % 39 which is index position 3

#say index is 0 and shift is 39 then add
#say index is 37 and the shift is 5, than add the two 42 % 39
#say index is 5 and shift is 5, then 10 % 39
#say index is 0 and shift is 1, then 1 % 39
def shorten
num1 = [*1..21]      # => [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21]
num2 = [1, 2, 3, 4]  # => [1, 2, 3, 4]

factor = (num1.length/num2.length) + 1  # => 6
elongated = num2 * 6                    # => [1, 2, 3, 4, 1, 2, 3, 4, 1, 2, 3, 4, 1, 2, 3, 4, 1, 2, 3, 4, 1, 2, 3, 4]

difference = elongated.length - num1.length  # => 3

elongated.pop(difference)  # => [2, 3, 4]
elongated                  # => [1, 2, 3, 4, 1, 2, 3, 4, 1, 2, 3, 4, 1, 2, 3, 4, 1, 2, 3, 4, 1]
end                        # => nil

shorten  # => [1, 2, 3, 4, 1, 2, 3, 4, 1, 2, 3, 4, 1, 2, 3, 4, 1, 2, 3, 4, 1]
