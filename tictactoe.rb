class GameBoard
    attr_reader :games_played

    @@games_played = 0
    @@wins_p1 = 0
    @@wins_p2 = 0
    @@ties = 0

    def initialize
        @p1 = "x"
        @p2 = "y"
        @moves = [[" ", " ", " "],[" "," ", " "],[" "," ", " "]]
        @@games_played += 1
        display_board(@moves)
    end

    def play_round
        player = @p1
        winner = nil
        for i in 0...9
            winner = move(player)
            puts winner
            break if winner
            player = (player == @p1 ? @p2 : @p1)
        end
        if winner
            puts "Player #{winner} wins!"
        else
            puts "Tie game!"
        end
    end

    private

    def move(player)
        puts "Player #{player}'s turn"
        row = ""
        column = ""
        loop do
            loop do
                print "Enter row number: "
                row = gets.chomp.to_i
                break if row.between?(0,2)
            end

            loop do
                print "Enter column number: "
                column = gets.chomp.to_i
                break if column.between?(0,2)
            end
            break if (@moves[row][column] == " ")
            puts "Spot already taken, pick again"
        end
        @moves[row][column] = player
        puts self
        check_winner(player, @moves)
    end

    def to_s
        display_board(@moves)
    end

    private

    def display_board(moves)
        puts "   -0- -1- -2- "
        puts "0 | #{moves[0][0]} | #{moves[0][1]} | #{moves[0][2]} |"
        puts "  |--- --- ---|"
        puts "1 | #{moves[1][0]} | #{moves[1][1]} | #{moves[1][2]} |"
        puts "  |--- --- ---|"
        puts "2 | #{moves[2][0]} | #{moves[2][1]} | #{moves[2][2]} |"
        puts "   --- --- --- "
    end
    
    def check_winner(player, moves)
        #row win
        for i in 0..2
            if (moves[i][0] == player) && (moves[i][1] == player) && (moves[i][2] == player)
                return player
            end
        end

        #column win
        for i in 0..2
            if (moves[0][i] == player) && (moves[1][i] == player) && (moves[2][i] == player)
                return player
            end
        end

        #diagonal win
        if ((moves[0][0] == player) && (moves[1][1] == player) && (moves[2][2] == player)) \
            || ((moves[2][0] == player) && (moves[1][1] == player) && (moves[0][2] == player))
            return player
        end

        return nil

    end

end
