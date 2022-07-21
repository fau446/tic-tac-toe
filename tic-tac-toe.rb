# Method for placing the 'marker' on 
  # Private method to check if the tile is valid
# class Player

class Game
  attr_accessor :game_finished, :tiles
  alias_method :game_finished?, :game_finished
  # Class variable for the board? def add_movie(movie) example?
  # Use hashes for each of the tiles?

  def initialize()
    @game_finished = false
    @tiles = {}
    for i in 1..9
      @tiles[i] = i
    end
  end

  def show_tiles()
    puts " #{@tiles[1]} | #{@tiles[2]} | #{@tiles[3]}"
    puts "---+---+---"
    puts " #{@tiles[4]} | #{@tiles[5]} | #{@tiles[6]}"
    puts "---+---+---"
    puts " #{@tiles[7]} | #{@tiles[8]} | #{@tiles[9]}"
  end

  def place_symbol(symbol, tile)
    loop do
      if (tile.is_a? Integer) && tile >= 1 && tile <= 9 && (@tiles[tile].is_a? Integer)
        @tiles[tile] = symbol
        break
      else
        puts "Sorry, invalid input, please try again"
        tile = gets.to_i
      end
    end
  end

  def check_game_status(symbol)
    if horizontal_win?(symbol) || vertical_win?(symbol) || diagonal_win?(symbol)
      puts 'WIN!'
      @game_finished = true
    elsif @tiles.values.all? { |value| value.is_a? String }
      puts "TIE!"
      @game_finished = true
    end
  end

  private
  def horizontal_win?(symbol)
    first_row = [@tiles[1], @tiles[2], @tiles[3]]
    second_row = [@tiles[4], @tiles[5], @tiles[6]]
    third_row = [@tiles[7], @tiles[8], @tiles[9]]

    if (first_row.all? { |tile| tile == symbol }) || (second_row.all? { |tile| tile == symbol }) || (third_row.all? { |tile| tile == symbol })
      return true
    end
    false
  end

  def vertical_win?(symbol)
    first_column = [@tiles[1], @tiles[4], @tiles[7]]
    second_column = [@tiles[2], @tiles[5], @tiles[8]]
    third_column = [@tiles[3], @tiles[6], @tiles[9]]
    if (first_column.all? { |tile| tile == symbol }) || (second_column.all? { |tile| tile == symbol }) || (third_column.all? { |tile| tile == symbol })
      return true
    end
    false
  end

  def diagonal_win?(symbol)
    first_diagonal = [@tiles[1], @tiles[5], @tiles[9]]
    second_diagonal = [@tiles[3], @tiles[5], @tiles[7]]
    if (first_diagonal.all? { |tile| tile == symbol }) || (second_diagonal.all? { |tile| tile == symbol })
      return true
    end
    false
  end
end

game = Game.new()

puts "Welcome to Tic-Tac-Toe!"

while game.game_finished? == false
  game.show_tiles
  puts "Player one (x), where would you like to place your symbol [1-9]?"
  tile = gets.to_i
  game.place_symbol('x', tile)
  game.show_tiles
  game.check_game_status('x')
  break if game.game_finished? == true

  puts "Player two (o), where would you like to place your symbol [1-9]?"
  tile = gets.to_i
  game.place_symbol('o', tile)
  game.check_game_status('o')
end

game.show_tiles