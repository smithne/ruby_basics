def stock_picker(prices)
    
    # initialize profit naiively assuming buy day 0, sell last day
    best_buy_day = 0
    best_sell_day = prices.length-1
    max_profit = prices[best_sell_day] - prices[best_buy_day]

    for i in 0...(prices.length-1) do
        buy_day = i
        for j in (buy_day+1)...(prices.length) do
            sell_day = j
            profit = prices[sell_day] - prices[buy_day]
            if profit > max_profit
                best_buy_day = buy_day
                best_sell_day = sell_day
                max_profit = profit
            end
        end
    end

    return [best_buy_day, best_sell_day]
end




puts stock_picker([4,17,3,6,9,15,8,6,10,118])
#> [1,4]  # for a profit of $15 - $3 == $12