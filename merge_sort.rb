def merge_sort(input_array)
    len = input_array.length
    if len < 2
        return input_array
    else
        left = merge_sort(input_array[0...len/2])    # sort left half
        right = merge_sort(input_array[len/2..-1])  # sort right half
    end
    # merge sorted halves
    sorted = merge(left, right)

    return sorted
end

def merge(a, b)
    merged = []
    i = 0
    j = 0

    begin
        if a[i] && (!b[j] || (a[i] <= b[j]))
            merged << a[i]
            i += 1
        else
            merged << b[j]
            j += 1
        end

    end until ((i == a.length) && (j == b.length))
    
    return merged

end

sorted = merge_sort([2, 4, 3]) # => [2, 3, 4]
sorted2 = merge_sort([1, 3, 2, 8, 5, 4, 8, 9, 12, 4]) # => [1, 2, 3, 4, 4, 5, 8, 8, 9, 12]
