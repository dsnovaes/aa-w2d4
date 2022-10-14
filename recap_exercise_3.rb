$alphabet = ("a".."z").to_a
$vowels = "aeiou"


def no_dupes?(arr)
    count = Hash.new(0)
    arr.each { |ele| count[ele] += 1 }
    count.select {|k,v|v==1}.keys
end

# p no_dupes?([1, 1, 2, 1, 3, 2, 4])         # => [3, 4]
# p no_dupes?(['x', 'x', 'y', 'z', 'z'])     # => ['y']
# p no_dupes?([true, true, true])            # => []

def no_consecutive_repeats?(arr)
    (0...arr.length-1).each do |i|
        return false if arr[i] == arr[i+1]
    end
    true
end

# # Examples
# p no_consecutive_repeats?(['cat', 'dog', 'mouse', 'dog'])     # => true
# p no_consecutive_repeats?(['cat', 'dog', 'dog', 'mouse'])     # => false
# p no_consecutive_repeats?([10, 42, 3, 7, 10, 3])              # => true
# p no_consecutive_repeats?([10, 42, 3, 3, 10, 3])              # => false
# p no_consecutive_repeats?(['x'])                              # => true

def char_indices(str)
    chars = Hash.new { |k,v| k[v] = [] }
    str.each_char.with_index { |char,i| chars[char] << i }
    chars
end

# # Examples
# p char_indices('mississippi')   # => {"m"=>[0], "i"=>[1, 4, 7, 10], "s"=>[2, 3, 5, 6], "p"=>[8, 9]}
# p char_indices('classroom')     # => {"c"=>[0], "l"=>[1], "a"=>[2], "s"=>[3, 4], "r"=>[5], "o"=>[6, 7], "m"=>[8]}

def longest_streak(str)



end

# Examples
# p longest_streak('a')           # => 'a'
# p longest_streak('accccbbb')    # => 'cccc'
# p longest_streak('aaaxyyyyyzz') # => 'yyyyy
# p longest_streak('aaabbb')      # => 'bbb'
# p longest_streak('abc')         # => 'c'

def is_prime?(num)
    return true if num < 2
    (2...num).each { |factor| return false if num % factor == 0  }
    true
end

def bi_prime?(num)
    factors = []
    (2...num).each do |factor| 
        if num % factor == 0 && is_prime?(factor)
            factors << factor 
        end
    end
    factors.each do |factor1|
        factors.each { |factor2| return true if factor1 * factor2 == num }
    end
    false

end

# # Examples
# p bi_prime?(14)   # => true
# p bi_prime?(22)   # => true
# p bi_prime?(25)   # => true
# p bi_prime?(94)   # => true
# p bi_prime?(24)   # => false
# p bi_prime?(64)   # => false

def vigenere_cipher(message,keys)
    new_str = ""
    message.each_char.with_index do |char,idx|
        temp = keys[idx % keys.length]
        new_idx = ($alphabet.index(char) + temp) % $alphabet.length
        new_str += $alphabet[new_idx]
    end
    new_str
end

# # Examples
# p vigenere_cipher("toerrishuman", [1])        # => "upfssjtivnbo"
# p vigenere_cipher("toerrishuman", [1, 2])     # => "uqftsktjvobp"
# p vigenere_cipher("toerrishuman", [1, 2, 3])  # => "uqhstltjxncq"
# p vigenere_cipher("zebra", [3, 0])            # => "ceerd"
# p vigenere_cipher("yawn", [5, 1])             # => "dbbo"

def vowel_rotate(str)
    vowels = []
    new_str = ""
    str.each_char { |char| vowels << char if $vowels.include?(char) }
    vowels.rotate!(-1)
    idx_count = 0
    str.each_char.with_index do |char,i|
        if !$vowels.include?(char)
            new_str += char
        else
            idx = idx_count % vowels.length
            new_str += vowels[idx]
            idx_count += 1
        end
    end
    new_str

end

# # Examples
# p vowel_rotate('computer')      # => "cempotur"
# p vowel_rotate('oranges')       # => "erongas"
# p vowel_rotate('headphones')    # => "heedphanos"
# p vowel_rotate('bootcamp')      # => "baotcomp"
# p vowel_rotate('awesome')       # => "ewasemo"



# PROC PROBLEMS

class String

    def self.select(&prc)
        
    end

end

# Examples
p "app academy".select { |ch| !"aeiou".include?(ch) }   # => "pp cdmy"
p "HELLOworld".select { |ch| ch == ch.upcase }          # => "HELLO"
p "HELLOworld".select          # => ""