#phase4

def second_anagram?(str1, str2)
    return false if str1.length != str2.length
    
    str1.each_char do |char|
        idx = str2.chars.find_index(char)
        str2.delete_at(idx)
    end

    str2.empty?
end

# p second_anagram?("gizmo", "sally")    #=> false
# p second_anagram?("elvis", "lives")    #=> true

#phase3
def merge(left_arr,right_arr)
    sorted_arr = [] 
    until left_arr.empty? || right_arr.empty?
        if left_arr.first < right_arr.first
            sorted_arr << left_arr.shift
        else
            sorted_arr << right_arr.shift
        end 
    end 
    sorted_arr +left_arr + right_arr #one of them will be empty so it doesn't matter
end 


def merge_sort(arr)
    return arr if arr.length < 2 
    mid_idx = arr.length/2
    left_arr = arr.take(mid_idx)
    right_arr = arr.drop(mid_idx)
    left_arr = merge_sort(left_arr)
    right_arr = merge_sort(right_arr)
    merge(left_arr,right_arr)
end 

#p merge_sort([3,-4,5,9,2,10])


def third_anagram?(str1, str2)
    merge_sort(str1.chars)==merge_sort(str2.chars) #nlogn + nlogn = 2nlogn = O(nlogn) 
end

#n + 2nlogn + n + n = 3n + 2nlogn ==> O(nlogn)
#2n (chars 2x) + 2nlogn(merge_sort)
#n + n + 2nlogn + n (equality operation)
# p third_anagram?("gizmo", "sally")    #=> false
# p third_anagram?("elvis", "lives")    #=> true


#phase4

def fourth_anagram?(str1, str2)
    str1_hash = Hash.new(0)
    str2_hash = Hash.new(0)

    str1.each_char { |char| str1_hash[char] += 1 }
    str2.each_char { |char| str2_hash[char] += 1 }

    str1_hash == str2_hash
end

def fourth_anagram_bonus?(str1,str2)
    #return false if str1.length != str2.length
    str1_hash = Hash.new(0)
    i = 0 
    while i < str2.length 
        if str1_hash.has_key?(str2[i])
            str1_hash[str2[i]]-=1
            str2[i]=""
        else 
            return false
        end 
    end 
    true
end
    # 2n => O(n)

p fourth_anagram_bonus?("gizmo", "sally")    #=> false
p fourth_anagram_bonus?("elvis", "lives")    #=> true

