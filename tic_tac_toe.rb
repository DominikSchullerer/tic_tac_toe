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

  def get_move
    move = Array.new(3)
    puts 'Enter your move'
    print 'Row: '
    move[0] = gets.chomp.to_i
    print 'Column: '
    move[1] = gets.chomp.to_i
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
    puts "#{@grid[1][0]}|#{@grid[1][1]}|#{@grid[2][2]}"
    puts '-----'
    puts "#{@grid[2][0]}|#{@grid[2][1]}|#{@grid[2][2]}"
  end
end

# Rules
# Rules is a module containing methods to check the validity of a move or if the game is won.

# GM
# GM is a class that directs the program flow.
