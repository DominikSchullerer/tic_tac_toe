# frozen_string_literal: true

# Player
# Player stores a name and its sign. It can get a move from a human player.
class Player
  attr_reader :name, :sign

  def initialize(sign)
    puts 'Please enter your name: '
    @name = gets.chomp
    @sign = sign
  end

  def move
    move = Array.new(3)

    begin
      puts "#{@name}, it's your turn. Enter your move."
      print 'Row: '
      move[0] = Integer(gets.chomp) - 1
      print 'Column: '
      move[1] = Integer(gets.chomp) - 1
    rescue StandardError
      puts 'Wrong input! Enter a number between 1 and 3.', ''
      retry
    end

    move[2] = sign

    move
  end
end

# Board
# Board stores the gamestate. It can draw the board to the console and update the gamestate.
class Board
  attr_reader :grid

  def initialize
    @grid = [[' ', ' ', ' '], [' ', ' ', ' '], [' ', ' ', ' ']]
  end

  def update(move)
    @grid[move[0]][move[1]] = move [2]
  end

  def draw
    puts "#{@grid[0][0]}|#{@grid[0][1]}|#{@grid[0][2]}"
    puts '-----'
    puts "#{@grid[1][0]}|#{@grid[1][1]}|#{@grid[1][2]}"
    puts '-----'
    puts "#{@grid[2][0]}|#{@grid[2][1]}|#{@grid[2][2]}"
  end
end

# Rules
# Rules is a module containing methods to check the validity of a move or if the game is won.
module Rules
  def self.row_winner(board)
    if board.grid[0][0] != ' ' && board.grid[0][0] == board.grid[0][1] && board.grid[0][1] == board.grid[0][2]
      board.grid[0][0]
    elsif board.grid[1][0] != ' ' && board.grid[1][0] == board.grid[1][1] && board.grid[1][1] == board.grid[1][2]
      board.grid[1][0]
    elsif board.grid[2][0] != ' ' && board.grid[2][0] == board.grid[2][1] && board.grid[2][1] == board.grid[2][2]
      board.grid[2][0]
    end
  end

  def self.column_winner(board)
    if board.grid[0][0] != ' ' && board.grid[0][0] == board.grid[1][0] && board.grid[1][0] == board.grid[2][0]
      board.grid[0][0]
    elsif board.grid[0][1] != ' ' && board.grid[0][1] == board.grid[1][1] && board.grid[1][1] == board.grid[2][1]
      board.grid[0][1]
    elsif board.grid[0][2] != ' ' && board.grid[0][2] == board.grid[1][2] && board.grid[1][2] == board.grid[2][2]
      board.grid[0][2]
    end
  end

  def self.diagonal_winner(board)
    if board.grid[0][0] != ' ' && board.grid[0][0] == board.grid[1][1] && board.grid[1][1] == board.grid[2][2]
      board.grid[0][0]
    elsif board.grid[0][2] != ' ' && board.grid[0][2] == board.grid[1][1] && board.grid[1][1] == board.grid[2][0]
      board.grid[0][2]
    end
  end

  def self.winner(board)
    if row_winner(board)
      row_winner(board)
    elsif column_winner(board)
      column_winner(board)
    elsif diagonal_winner(board)
      diagonal_winner(board)
    end
  end

  def self.valid_move?(board, move)
    is_valid = true

    if move[0].between?(0, 2) && move[1].between?(0, 2)
      unless board.grid[move[0]][move[1]] == ' '
        puts 'Wrong input! This square is not empty.', ''
        is_valid = false
      end
    else
      puts 'Wrong input! Enter a number between 1 and 3.', ''
      is_valid = false
    end

    is_valid
  end

  def self.no_possible_moves?(board)
    no_possible_moves = true

    board.grid.each do |row|
      no_possible_moves = false if row.include?(' ')
    end

    no_possible_moves
  end
end

# Gamemaster
# Gamemaster is a class that directs the program flow.
class Gamemaster
  def get_valid_move
    is_valid = false
    until is_valid
      move = @active_player.move
      is_valid = true if Rules.valid_move?(@board, move)
    end
    move
  end

  def turn
    @active_player, @next_player = @next_player, @active_player
    move = get_valid_move
    @board.update(move)
    @board.draw
  end

  def setup_players
    @active_player = Player.new('X')
    @next_player = Player.new('O')
    @active_player, @next_player = @next_player, @active_player if rand > 0.5
  end

  def check_gamestate
    if Rules.winner(@board)
      @gamestate = 'winner'
    elsif Rules.no_possible_moves?(@board)
      @gamestate = 'draw'
    end
  end

  def final_message
    if @gamestate == 'winner'
      puts "#{@active_player.name} hast won the game!"
    elsif @gamestate == 'draw'
      puts 'The game has ended in a draw'
    else 
      puts 'Error! This should not be reached'
    end
  end

  def game
    setup_players
    @board = Board.new
    @gamestate = 'active'
    @board.draw
    while @gamestate == 'active'
      turn
      check_gamestate
    end
    final_message
  end
end

gamemaster = Gamemaster.new
gamemaster.game
