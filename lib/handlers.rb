require_relative 'board'

class Handlers
  attr_reader :moves
  def initialize(board = Board.new)
    @moves = [[1,2,3],[4,5,6],[7,8,9],[1,4,7],[2,5,8],[3,6,9],[1,5,9],[3,5,7]]
    @board = board
    @position
  end

  def winner?(player)
    @moves.any? do |line|
      line.all? do |position|
        @board.convert_input(position)
        @board.board[@board.cell[0]][@board.cell[1]] == player.symbol
      end
    end
  end

  def draw?
    @board.board.flatten.map { |cell| cell.class == String }.all?(true)
  end

  def game_over?(player)
    return :winner if winner?(player)
    return :draw if draw?
    false
  end
end
