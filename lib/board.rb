# frozen_string_literal: true

class Board
  attr_reader :board, :cell

  def initialize
    @board = default_grid
    @cell = []
  end

  def print_board
    puts '--+---+---'
    @board.each do |row|
      puts row.join(' | ')
      puts '--+---+---'
    end
  end

  def set_cell(player, input)
    convert_input(input)
    if cell_empty && (1..9).include?(input)
      @board[@cell[0]][@cell[1]] = player.symbol
    else
      false
    end
  end

  def convert_input(input)
    first = (input % 3).zero? ? (input / 3) - 1 : (input / 3)
    second = (input - 1) % 3
    @cell = [first, second]
  end

  private

  def default_grid
    [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
  end

  def cell_empty
    @board[@cell[0]][@cell[1]] == 'X' || @board[@cell[0]][@cell[1]] == 'O' ? false : true
  end
end
