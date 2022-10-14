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

    def select(&prc)
        if !prc
            ""
        else
            new_str = ""
            self.each_char { |char| new_str += char if prc.call(char) }
            new_str
        end
    end

    def map!(&prc)
        self.each_char.with_index { |char,i| self[i] = prc.call(char,i) }
    end

end

# # Examples
# p "app academy".select { |ch| !"aeiou".include?(ch) }   # => "pp cdmy"
# p "HELLOworld".select { |ch| ch == ch.upcase }          # => "HELLO"
# p "HELLOworld".select          # => ""

# Examples
# word_1 = "Lovelace"
# word_1.map! do |ch| 
#     if ch == 'e'
#         '3'
#     elsif ch == 'a'
#         '4'
#     else
#         ch
#     end
# end
# p word_1        # => "Lov3l4c3"

# word_2 = "Dijkstra"
# word_2.map! do |ch, i|
#     if i.even?
#         ch.upcase
#     else
#         ch.downcase
#     end
# end
# p word_2        # => "DiJkStRa"


# Recursion Hell

def multiply(a,b)
    # base case
    return 0 if b == 0

    # recursive step
    a + multiply(a,b-1)
end

# p multiply(3,5)



def lucas_sequence(n)

    # base case - returns a number, just as the function should return
    return [] if n == 0
    return [2] if n == 1
    return [2,1] if n == 2


    # recursive step
    seq = lucas_sequence(n - 1)
    seq << seq[-1] + seq[-2]
    seq


end

# p lucas_sequence(0)   # => []
# p lucas_sequence(1)   # => [2]    
# p lucas_sequence(2)   # => [2, 1]
# p lucas_sequence(3)   # => [2, 1, 3]
# p lucas_sequence(6)   # => [2, 1, 3, 4, 7, 11]
# p lucas_sequence(8)   # => [2, 1, 3, 4, 7, 11, 18, 29]


def prime_factorization(num)


    arr = 

end

# Examples
prime_factorization(12)     # => [2, 2, 3]
prime_factorization(24)     # => [2, 2, 2, 3]
prime_factorization(25)     # => [5, 5]
prime_factorization(60)     # => [2, 2, 3, 5]
prime_factorization(7)      # => [7]
prime_factorization(11)     # => [11]
prime_factorization(2017)   # => [2017]