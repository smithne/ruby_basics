# pick number of games

    # play one game
        # computer picks colors, human guesses
            # computer comes up with colors randomly
        
        # PART 2: allow user to pick who is codemaker or codebreaker

# game flow

# start game
    # parameters
        # who is codemaker, who is codebreaker (CPU or player)
        # (stretch, default 12) how many turns
        # (stretch, default 6) how many colors
        # (stretch, default 4) code length
    # draw blank board
    # computer sets code
    # until either code is guessed correctly or out of turns:
        # player guesses
        # check for correctness
        # re-draw board with guess and result
        # if all guesses are correct, codemaker wins
        # else, increment guess count. if guess count == turn limit, codebreaker wins

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
            guess = "red red red red" #gets.chomp
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

        # after checking position, loop through again to find
        # how many were correct color but wrong position
        for i in 0...guess.length
            if code_copy.include?(guess[i]) and !(hits.has_key?(i))
                correct_color += 1
                code_copy.delete_at(code_copy.index(guess[i]))
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

    def play_round
        guess = @human_player.guess()
        @turn_count += 1
        result = @comp_player.evaluate_guess(guess)
        board.add_turn(guess, result)

        if result[:correct_position] == 4
            # codebreaker wins
        else
            # play another round
        end

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

game.play_round

# start game
    # parameters
        # who is codemaker, who is codebreaker (CPU or player)
        # (stretch, default 12) how many turns
        # (stretch, default 6) how many colors
        # (stretch, default 4) code length
    # draw blank board
    # computer sets code
    # until either code is guessed correctly or out of turns:
        # player guesses
        # check for correctness
        # re-draw board with guess and result
        # if all guesses are correct, codemaker wins
        # else, increment guess count. if guess count == turn limit, codebreaker wins