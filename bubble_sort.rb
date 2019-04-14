def bubble_sort(input_array)
    sorted = input_array
    for i in (0...sorted.length)
        for j in (0...sorted.length-1)
            a = sorted[i]
            b = sorted[j]
            if a < b
                holder = b
                sorted[j] = a
                sorted[i] = holder
            end
            j += 1
        end
        i += 1
    end

    sorted
end

puts bubble_sort([4,3,78,2,0,2])


def bubble_sort_by(input_array)
    sorted = input_array

    for i in (0...sorted.length)
        for j in (0...sorted.length-1)
            a = sorted[i]
            b = sorted[j]
            sort = yield(a, b)
            if sort < 0
                holder = b
                sorted[j] = a
                sorted[i] = holder
            end
            j += 1
        end
        i += 1
    end

    return sorted

end

length_sorted = bubble_sort_by(["hi","hello","hey"]) do |left,right|
    left.length - right.length
end

puts length_sorted