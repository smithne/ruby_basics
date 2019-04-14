counter_one = 1
counter_two = 2

sum = 0

while counter_one <= 4000000
    puts counter_one
    puts counter_two
    puts ""
    if (counter_one % 2 == 0)
        sum += counter_one
    end
    counter_holder = counter_two
    counter_two = counter_one + counter_two
    counter_one = counter_holder
end


puts 'Total: ' + sum.to_s
