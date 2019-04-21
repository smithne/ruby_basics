class Player
    attr_reader :role

    @@code_length = 4

    def initialize(role, possible_colors)
        @role = role
        @possible_colors = possible_colors
    end

    def guess
        puts "enter four colours separated by spaces"
        puts "choices: " + Game.colors.join(" ")
        guess_conforms = false

        begin
            # dummy guess for debugging
            # guess = "green blue green yellow" 
            guess = gets.chomp
            guess_conforms = validate_guess?(guess)
            puts guess_conforms
        end until guess_conforms
        puts guess
        return guess
    end

    def validate_guess?(guess)
        guess_array = guess.downcase.split
        conforms = (guess_array.length == 4)
        guess_array.each do |color|
            @possible_colors.include?(color) ? true : conforms = false
        end
    
        return conforms
    end

    def evaluate_guess(guess)
        guess = guess.split(" ")
        code_copy = get_secret_code.dup
        correct_position = 0
        correct_color = 0
        hits = Hash.new

        # loop through to check for correct color in correct position.
        for i in 0...guess.length
            if guess[i] == code_copy[i]
                hits[i] = guess[i]
            end
        end
        correct_position = hits.length

        for i in 0...code_copy.length
            if guess.include?(code_copy[i]) and !(hits.has_key?(i))
                correct_color += 1
                guess.delete_at(guess.index(code_copy[i]))
            end
        end

        return {correct_color: correct_color, correct_position: correct_position}

    end

end


class Human < Player

end

class ComputerPlayer < Player

    def initialize(role, possible_colors)
        super(role, possible_colors)
        if role == "codemaker"
            choose_code(possible_colors)
        end
    end

    def get_secret_code
        return @secret_code
    end

    private

    def choose_code(possible_colors)
        @secret_code = Array.new
        for i in 0...@@code_length
            rand_choice = rand(possible_colors.length)
            @secret_code[i] = possible_colors[rand_choice]
        end
    end

end

class Game
    attr_reader :turn_count, :board

    @@turns = 12
    @@colors = ['red', 'green', 'blue', 'purple', 'orange', 'yellow']

    def initialize(human_player, comp_player, board)
        @turn_count = 0
        @human_player = human_player
        @comp_player = comp_player
        @board = board
        @board.draw_board()
    end

    def play_turn
        guess = @human_player.guess()
        
        result = @comp_player.evaluate_guess(guess)
        board.add_turn(guess, result)

        if result[:correct_position] == 4
            return "codebreaker"
        else
            return nil
        end

    end

    def play_round
        winner = nil
        while (@turn_count < @@turns) and !winner do
            winner = self.play_turn()
            @turn_count += 1
        end
        return winner || "codemaker"
    end


    def self.colors
        return @@colors
    end

end

class Board

    def initialize
        puts "board initialized"
    end

    def draw_board
        puts "new game started"
    end

    def add_turn(guess, result)
        puts "The player guessed: #{guess}"
        puts "There were #{result[:correct_position]} guesses in the correct position"
        puts "There were #{result[:correct_color]} guesses of the correct color but wrong position"
    end

end

player_one = Human.new("codebreaker", Game.colors)
ai = ComputerPlayer.new("codemaker", Game.colors)
board = Board.new()
game = Game.new(player_one, ai, board)

puts game.play_round + " wins!"
