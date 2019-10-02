class GameBoard
  attr_accessor :cells, :win

  def initialize
    @@cells = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    display_board
  end

  def self.cells
    @@cells
  end

  def display_board
    @@cells[0..2].each { |n| print n.to_s + " | " }
    print "\n-----------\n"
    @@cells[3..5].each { |n| print n.to_s + " | " }
    print "\n-----------\n"
    @@cells[6..8].each { |n| print n.to_s + " | " }
  end

  def self.won?
    @@win = false
  end

  def check_win(player_symbol)
    if horizontal?(player_symbol) || vertical?(player_symbol) || diagonal?(player_symbol)
      @@win = true
      puts "\nPlayer #{player_symbol} wins! Re-run the program to play again."
      exit
    end
  end

  def horizontal?(player_symbol)
    ((@@cells[0] == player_symbol) && (@@cells[1] == player_symbol) && (@@cells[2] == player_symbol)) ||
    ((@@cells[3] == player_symbol) && (@@cells[4] == player_symbol) && (@@cells[5] == player_symbol)) ||
    ((@@cells[6] == player_symbol) && (@@cells[7] == player_symbol) && (@@cells[8] == player_symbol))
  end

  def vertical?(player_symbol)
    ((@@cells[0] == player_symbol) && (@@cells[3] == player_symbol) && (@@cells[6] == player_symbol)) ||
    ((@@cells[1] == player_symbol) && (@@cells[4] == player_symbol) && (@@cells[7] == player_symbol)) ||
    ((@@cells[2] == player_symbol) && (@@cells[5] == player_symbol) && (@@cells[8] == player_symbol))
  end

  def diagonal?(player_symbol)
    ((@@cells[0] == player_symbol) && (@@cells[4] == player_symbol) && (@@cells[8] == player_symbol)) ||
    ((@@cells[2] == player_symbol) && (@@cells[4] == player_symbol) && (@@cells[6] == player_symbol))
  end

  def cat_game?
    if @@cells.all? { |cell| cell == "X" || cell == "O" }
      puts "\nCat's game! Re-run the program to play again."
      exit
    end
  end
end

class Player
  def initialize(marker)
    @marker = marker
  end

  def make_move(number)
    if GameBoard.cells[number].is_a? Integer
      GameBoard.cells[number] = @marker.to_s
      end
  end
end

def play_game
  puts "Welcome to Tic-Tac-Toe!"
  board = GameBoard.new
  player_x = Player.new("X")
  player_o = Player.new("O")

  while GameBoard.won? == false
    puts "\nPlayer X, make your move!"
    x_input = gets.chomp
    if x_input.to_i > 9 || x_input.to_i < 1
      puts "***Please input a valid number***"
      board.display_board
      redo if true
    else
      player_x.make_move(x_input.to_i - 1)
      board.display_board
      board.check_win("X")
      board.cat_game?
    end
    puts "\nPlayer O, make your move!"
    o_input = gets.chomp
    if o_input.to_i > 9 || o_input.to_i < 1
      puts "***Please input a valid number***"
      board.display_board
      redo if true
    else
      player_o.make_move(o_input.to_i - 1)
      board.display_board
      board.check_win("O")
      board.cat_game?
    end
  end
end

play_game
