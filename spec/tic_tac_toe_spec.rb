# frozen_string_literal: true

require_relative '../lib/board'
require_relative '../lib/handlers'
require_relative '../lib/player'

RSpec.describe Handlers do
  let(:player) { Player.new('X', 'Christian') }
  let(:player2) { Player.new('O', 'Laura') }
  let(:newBoard) { Board.new }
  let(:game) { Handlers.new(newBoard) }

  describe '#game_over?' do
    it 'Returns :winner if the first row is filled with the same symbol' do
      newBoard.set_cell(player, 1)
      newBoard.set_cell(player, 2)
      newBoard.set_cell(player, 3)
      expect(game.game_over?(player)).to eql(:winner)
    end

    it 'Returns :winner if the second row is filled with the same symbol' do
      newBoard.set_cell(player, 4)
      newBoard.set_cell(player, 5)
      newBoard.set_cell(player, 6)
      expect(game.game_over?(player)).to eql(:winner)
    end

    it 'Returns :winner if the third row is filled with the same symbol' do
      newBoard.set_cell(player, 7)
      newBoard.set_cell(player, 8)
      newBoard.set_cell(player, 9)
      expect(game.game_over?(player)).to eql(:winner)
    end

    it 'Returns :winner if the first column is filled with the same symbol' do
      newBoard.set_cell(player, 1)
      newBoard.set_cell(player, 4)
      newBoard.set_cell(player, 7)
      expect(game.game_over?(player)).to eql(:winner)
    end

    it 'Returns :winner if the second column is filled with the same symbol' do
      newBoard.set_cell(player, 2)
      newBoard.set_cell(player, 5)
      newBoard.set_cell(player, 8)
      expect(game.game_over?(player)).to eql(:winner)
    end

    it 'Returns :winner if the third column is filled with the same symbol' do
      newBoard.set_cell(player, 3)
      newBoard.set_cell(player, 6)
      newBoard.set_cell(player, 9)
      expect(game.game_over?(player)).to eql(:winner)
    end

    it 'Returns :winner if a diagonal is filled with the same symbol' do
      newBoard.set_cell(player, 1)
      newBoard.set_cell(player, 5)
      newBoard.set_cell(player, 9)
      expect(game.game_over?(player)).to eql(:winner)
    end

    it 'Returns :winner if the other diagonal is filled with the same symbol' do
      newBoard.set_cell(player, 3)
      newBoard.set_cell(player, 5)
      newBoard.set_cell(player, 7)
      expect(game.game_over?(player)).to eql(:winner)
    end

    it "Returns :draw if all cells are filled and there's not a winner" do
      newBoard.set_cell(player, 1)
      newBoard.set_cell(player2, 2)
      newBoard.set_cell(player, 3)
      newBoard.set_cell(player2, 4)
      newBoard.set_cell(player, 5)
      newBoard.set_cell(player2, 6)
      newBoard.set_cell(player, 8)
      newBoard.set_cell(player2, 7)
      newBoard.set_cell(player2, 9)
      expect(game.game_over?(player)).to eql(:draw)
    end
  end
end
