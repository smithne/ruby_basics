def get_factors(input_num)
    factors = []
    n = 1
    while n <= input_num ** 0.5
        if ((input_num % n) == 0)
            factors << n
        end
        n += 1
    end

    return factors
end

def is_prime(input_num)
    n = 2
    while n < input_num
        if ((input_num % n) == 0)
            return false
        end
        n += 1
    end

    return true
end

def largest_prime(input_num)
    factors = get_factors(input_num)
    i = factors.length - 1
    while i >= 0
        if (is_prime(factors[i]))
            return factors[i]
        end
        i -= 1
    end
    return 'error'
end


puts largest_prime(13195)

puts largest_prime(600851475143)

puts is_prime(9)
puts is_prime(4)
puts is_prime(12)

puts is_prime(5)
puts is_prime(7)
puts is_prime(13)