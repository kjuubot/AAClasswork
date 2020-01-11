#my_min

#phase1
def my_min(arr)
    current_min=arr.first
    arr.each do |ele1|
        arr.each do |ele2|
            if current_min > ele1 || current_min > ele2
                ele1 < ele2 ? current_min = ele1 : current_min = ele2
            end 
        end
    end 
    current_min
end

#O(n^2)

#phase2
def my_min(arr)
    arr.inject{|acc,ele|acc < ele ? acc : ele}
end 

#O(n)

# p my_min([ 0, 3, 5, 4, -5, 10, 1, 90 ])

#largest contiguous sub-sum

#phase1
def largest_contiguous_subsum(list)
    sub_arr = []

    (0...list.length).each do |first|
        (first...list.length).each do |second|
            sub_arr << list[first..second]
        end
    end

    largest_sum_arr = sub_arr.inject{|acc,ele|acc.sum > ele.sum ? acc : ele }
    largest_sum_arr.sum 
end

#O(n^2)

list = [5, 3, -7]
p largest_contiguous_subsum(list)


def largest_contiguous_subsum(list)
    largest_sum = list.first
    current_sum = list.first
    i = 1
    while i < list.length
        current_sum+=list[i]
        if current_sum>=current_sum+list[i] 
            largest_sum = current_sum
            i+=1
        else
            current_sum += list[i]
            i+=2


        
    end 


end 

