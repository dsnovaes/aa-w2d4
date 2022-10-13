# Write a method, all_vowel_pairs, that takes in an array of words and returns all pairs of words
# that contain every vowel. Vowels are the letters a, e, i, o, u. A pair should have its two words
# in the same order as the original array. 
#
# Example:
#
# all_vowel_pairs(["goat", "action", "tear", "impromptu", "tired", "europe"])   # => ["action europe", "tear impromptu"]

$vowels = "aeiou"

def all_vowel_pairs(words)
    result = []
    words.each_with_index do |word1,idx1|
        words.each_with_index do |word2,idx2|
            if idx2 > idx1 && all_vowels?(word1,word2)
                result << word1 + " " + word2
            end
        end
    end
    result
end

def all_vowels?(word1,word2)
    vowels = {"a"=>false,"e"=>false,"i"=>false,"o"=>false,"u"=>false}
    word1.each_char { |char| vowels[char] = true if $vowels.include?(char) }
    word2.each_char { |char| vowels[char] = true if $vowels.include?(char) }
    !vowels.has_value?(false)
end


# Write a method, composite?, that takes in a number and returns a boolean indicating if the number
# has factors besides 1 and itself
#
# Example:
#
# composite?(9)     # => true
# composite?(13)    # => false
def composite?(num)
    (2...num).each { |factor| return true if num % factor == 0 }
    false
end


# A bigram is a string containing two letters.
# Write a method, find_bigrams, that takes in a string and an array of bigrams.
# The method should return an array containing all bigrams found in the string.
# The found bigrams should be returned in the the order they appear in the original array.
#
# Examples:
#
# find_bigrams("the theater is empty", ["cy", "em", "ty", "ea", "oo"])  # => ["em", "ty", "ea"]
# find_bigrams("to the moon and back", ["ck", "oo", "ha", "at"])        # => ["ck", "oo"]
def find_bigrams(str, bigrams)
    bigrams.select { |bigram| str.include?(bigram) }
end

class Hash
    # Write a method, Hash#my_select, that takes in an optional proc argument
    # The method should return a new hash containing the key-value pairs that return
    # true when passed into the proc.
    # If no proc is given, then return a new hash containing the pairs where the key is equal to the value.
    #
    # Examples:
    #
    # hash_1 = {x: 7, y: 1, z: 8}
    # hash_1.my_select { |k, v| v.odd? }          # => {x: 7, y: 1}
    #
    # hash_2 = {4=>4, 10=>11, 12=>3, 5=>6, 7=>8}
    # hash_2.my_select { |k, v| k + 1 == v }      # => {10=>11, 5=>6, 7=>8})
    # hash_2.my_select                            # => {4=>4}
    def my_select(&prc)
        self.select {  |k,v| !prc ? k == v : prc.call(k,v) }
    end
end

$alphabet = ("a".."z").to_a

class String
    # Write a method, String#substrings, that takes in a optional length argument
    # The method should return an array of the substrings that have the given length.
    # If no length is given, return all substrings.
    #
    # Examples:
    #
    # "cats".substrings     # => ["c", "ca", "cat", "cats", "a", "at", "ats", "t", "ts", "s"]
    # "cats".substrings(2)  # => ["ca", "at", "ts"]
    def substrings(length = nil)
        substrings = []
        arr = self.split("")
        arr.each_with_index do |ele1,idx1|
            arr.each_with_index do |ele2,idx2|
                if !length
                    if idx1 == idx2
                        substrings << ele1
                    elsif idx2 > idx1
                        substrings << self[idx1..idx2]
                    end
                else
                    if idx2 > idx1 && idx2 - idx1 == length - 1 
                        substrings << self[idx1..idx2]
                    end
                end
            end
        end
        substrings
    end


    # Write a method, String#caesar_cipher, that takes in an a number.
    # The method should return a new string where each char of the original string is shifted
    # the given number of times in the alphabet.
    #
    # Examples:
    #
    # "apple".caesar_cipher(1)    #=> "bqqmf"
    # "bootcamp".caesar_cipher(2) #=> "dqqvecor"
    # "zebra".caesar_cipher(4)    #=> "difve"
    def caesar_cipher(num)
        result = ""
        self.each_char do |char|
            new_char_index = ($alphabet.index(char) + num) % $alphabet.length
            result += $alphabet[new_char_index]
        end
        result
    end
end

p "apple".caesar_cipher(1)    #=> "bqqmf"
p "bootcamp".caesar_cipher(2) #=> "dqqvecor"
p "zebra".caesar_cipher(4)    #=> "difve"