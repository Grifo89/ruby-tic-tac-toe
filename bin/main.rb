require_relative '../lib/board'
require_relative '../lib/handlers'
require_relative '../lib/player'

class Game
  attr_reader :board, :current_player, :other_player, :players, :winner, :draw
  def initialize(board = Board.new)
    @board = board
    @handlers = Handlers.new(board)
    @players = players_names
    @current_player, @other_player = players.shuffle
  end

  def play
    puts "The sorting hat has talked, the first person to start is: #{current_player.name} with '#{current_player.symbol}' \n\n"
    begin
      @board.print_board
      print "#{current_player.name}, please enter a position: \n"
      position = gets.to_i
      while !@board.set_cell(current_player, position)
        puts "That cell is not available or the caracter is not allowed, please choose another one \n"
        position = gets.to_i
      end
      switch_player!
    end while(@handlers.game_over?(current_player) == :winner || @handlers.game_over?(current_player) == :draw ? false : true)
    puts game_over_message
  end

  private

  def players_names
    players = []
    puts "Player 1, please enter your name: \n"
    player1_name = gets.chomp
    players.push(player1 = Player.new("X", player1_name))
    puts "Player 2, please enter your name \n"
    player2_name = gets.chomp
    players.push(player2 = Player.new("O", player2_name))
    return players
  end

  def switch_player!
    @current_player, @other_player = @other_player, @current_player
  end

  def game_over_message
    return "#{current_player.name} won!" if @handlers.game_over?(current_player) == :winner
    return "The game ended in a tie" if @handlers.game_over?(current_player) == :draw
  end

end

Game.new.play
