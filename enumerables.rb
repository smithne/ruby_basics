module Enumerable

    def my_each
        return self unless block_given?
        
        for element in self
            yield(element)
        end
        self
    end

    def my_each_with_index
        return self unless block_given?
        i = 0
        for element in self
            yield(element, i)
            i += 1
        end
        self
    end


    def my_select
        return self unless block_given?
        result = []
        for element in self
            result << element if yield(element)
        end
        result
    end

    def my_all?
        all = true

        for element in self
            all = all && yield(element)
        end

        return all
    end

    def my_any?
        any = false
        for element in self
            any = any || yield(element)
        end
        return any
    end

    def my_none?
        none = true
        for element in self
            none = none && !yield(element)
        end
        return none
    end

    def my_count
        count = 0
        for element in self
            count += yield(element) ? 1 : 0
        end
        count
    end

    def my_map
        return self.to_enum(:my_map) unless block_given?
        result = []
        for element in self
            result << yield(element)
        end
        return result
    end

    def my_inject(*args)
        if (args.length == 2)
            return "#inject(initial, sym)"
        elsif ((args.length == 1) && (args[0].is_a? Symbol))
            return "#inject(sym)" 
        elsif ((args.length == 1) && (args[0].is_a? Numeric) && block_given)
            return "#inject(initial) { |memo, obj| block } → obj"
        elsif ((args.length == 0) && block_given)
            return "#inject { |memo, obj| block }"
        else
            return "Unknown argument syntax"
        end
    end


    my_array = [1, 2, 3, 4, 5, 6, 7]

    doubled = my_array.my_map {|x| x*2}

end

