# frozen_string_literal: true

PLAYER_ONE = 'X'
PLAYER_TWO = 'O'

def initialize_board
  @count = 5
  @player = PLAYER_ONE
  @board = Array.new(3) { Array.new(3, ' ') }
end

def get_inputs
  begin
    print "#{@player}, please enter the row: \n"
    input_row = gets

    print "#{@player}, please enter the column: \n"
    input_column = gets

    unless (valid = valid_move?(input_row.to_i, input_column.to_i))
      puts "That one is taken \'#{@player}', try again: "
    end
  end while(!valid)
  [input_row.to_i, input_column.to_i]
end

def valid_move?(input_row, input_column)
  @board[input_row. -1][input_column. -1].strip.empty?
end

def update_board(inputs)
  @board[inputs[0] - 1][inputs[1] - 1] = @player
end

def play
  inputs = get_inputs
  update_board(inputs)
  print_board
end

def switch_player
  @player = if @player == PLAYER_ONE
              PLAYER_TWO
            else
              PLAYER_ONE
            end
end

def game_over?
  @count -= 1
  @count <= 0
end

def print_board
  puts '--+---+---'
  @board.each do |row|
    puts row.join(' | ')
    puts '--+---+---'
  end
end

initialize_board
print_board
begin
  break unless play

  switch_player
end while !game_over?
puts 'The game keeps going until someone wins or there\'s a draw' if game_over?
