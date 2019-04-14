#caesar_cipher("What a string!", 5)
#"Bmfy f xywnsl!"

def caesar_cipher(input, offset)

    i = 0
    shifted = ""

    while i < input.length do
        char = input[i].downcase
        uppercase = (('A'..'Z') === input[i]) ? true : false
        if (/[A-Z|a-z]/ =~ char)
            shifted_char = shift(char, offset)
            shifted += uppercase ? shifted_char.upcase : shifted_char.downcase
        else
            shifted += char
        end
        i += 1
    end

    return shifted

end

def shift(char, offset)
    min = "a".ord
    max = "z".ord
    delta = max - min + 1
    
    char_num = char.ord + offset

    while char_num > max do
        char_num -= delta
    end

    while char_num < min do
        char_num += delta
    end

    return char_num.chr
    
end

puts caesar_cipher("What a string!", 5)