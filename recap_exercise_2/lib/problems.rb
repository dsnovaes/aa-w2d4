# Write a method, least_common_multiple, that takes in two numbers and returns the smallest number that is a mutiple
# of both of the given numbers
def least_common_multiple(num_1, num_2)
    x = 1
    until x % num_1 == 0 && x % num_2 == 0
        x += 1
    end
    x
end

# Write a method, most_frequent_bigram, that takes in a string and returns the two adjacent letters that appear the
# most in the string.
def most_frequent_bigram(str)
    bigrams = Hash.new(0)
    (0...str.length-1).each { |i| bigrams[str[i] + str[i+1]] += 1 } 
    bigrams.sort_by {|k,v| v}[-1][0]
end


class Hash
    # Write a method, Hash#inverse, that returns a new hash where the key-value pairs are swapped
    def inverse
        inversed = {}
        self.each {|k,v| inversed[v] = k}
        inversed
    end
end


class Array
    # Write a method, Array#pair_sum_count, that takes in a target number returns the number of pairs of elements that sum to the given target
    def pair_sum_count(num)
        pairs = []
        self.each_with_index do |ele1,idx1|
            self.each_with_index { |ele2,idx2| pairs << [ele1,ele2] if idx2 > idx1 && ele1 + ele2 == num }
        end
        pairs.count

    end

    # Write a method, Array#bubble_sort, that takes in an optional proc argument.
    # When given a proc, the method should sort the array according to the proc.
    # When no proc is given, the method should sort the array in increasing order.
    #
    # Sorting algorithms like bubble_sort, commonly accept a block. That block accepts
    # two parameters, which represents the two elements in the array being compared.
    # If the block returns 1, it means that the second element passed to the block
    # should go before the first (i.e. switch the elements). If the block returns -1,
    # it means the first element passed to the block should go before the second
    # (i.e. do not switch them). If the block returns 0 it implies that
    # it does not matter which element goes first (i.e. do nothing).
    #
    # This should remind you of the spaceship operator! Convenient :)
    def bubble_sort(&prc)
        # prc ||= Proc.new(prc)

        sorted = false
        while !sorted
            sorted = true
    
            (0...self.length - 1).each do |i|
                if prc
                    if prc.call(self[i],self[i + 1]) == 1
                        self[i], self[i + 1] = self[i + 1], self[i]  
                        sorted = false
                    end
                elsif !prc && self[i] > self[i + 1]
                    self[i], self[i + 1] = self[i + 1], self[i]  
                    sorted = false
                end
            end

        end
        self

        
    end
end

array1 = [4, 12, 2, 8, 1, 14, 9, 25, 24, 81]

p array1.bubble_sort  { |a, b| a.to_s <=> b.to_s }

