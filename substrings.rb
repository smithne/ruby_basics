#> dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
#> substrings("below", dictionary)
#=> { "below" => 1, "low" => 1 }

#> substrings("Howdy partner, sit down! How's it going?", dictionary)
# => { "down" => 1, "how" => 2, "howdy" => 1,"go" => 1, "going" => 1, "it" => 2, "i" => 3, "own" => 1,"part" => 1,"partner" => 1,"sit" => 1 }

def substrings(string, dictionary)
    counts = Hash.new(0)

    dictionary.each do |word|
        occurrences = string.downcase.scan(word).length
        occurrences > 0 ? counts[word] = occurrences : nil
    end

    return counts

end

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
puts substrings("below", dictionary)
#=> { "below" => 1, "low" => 1 }

puts substrings("Howdy partner, sit down! How's it going?", dictionary)
# => { "down" => 1, "how" => 2, "howdy" => 1,"go" => 1, "going" => 1, "it" => 2, "i" => 3, "own" => 1,"part" => 1,"partner" => 1,"sit" => 1 }