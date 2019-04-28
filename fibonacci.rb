def fibs(n)
    x = 0
    y = 1
    for i in (0...n-1)
        dummy = x
        x = y
        y = dummy + x
    end
    x
end

def fibs_rec(n)
    return 0 if n <= 1
    return 1 if n == 2
    return fibs_rec(n-1) + fibs_rec(n-2)
end