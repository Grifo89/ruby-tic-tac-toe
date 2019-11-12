require_relative '../lib/board'
require_relative '../lib/handlers'
require_relative '../lib/player'

RSpec.describe Handlers do
  let(:player) do
    player = Player.new("X", "Christian")
  end
  describe "#game_over?" do
    it "Returns :winner if the first row is filled with the same symbol" do
      class Board1 < Board
        private def default_grid
          [["X", "X", "X"], [4, 5, 6], [7, 8, 9]]
        end
      end
      board1 = Board1.new
      game = Handlers.new(board1)
      expect(game.game_over?(player)).to eql(:winner)
    end

    it "Returns :winner if the second row is filled with the same symbol" do
      class Board1 < Board
        private def default_grid
          [[1, 2, 3], ["X", "X", "X"], [7, 8, 9]]
        end
      end
      board1 = Board1.new
      game = Handlers.new(board1)
      expect(game.game_over?(player)).to eql(:winner)
    end

    it "Returns :winner if the third row is filled with the same symbol" do
      class Board1 < Board
        private def default_grid
          [[1, 2, 3], [4, 5, 6], ["X", "X", "X"]]
        end
      end
      board1 = Board1.new
      game = Handlers.new(board1)
      expect(game.game_over?(player)).to eql(:winner)
    end

    it "Returns :winner if the first column is filled with the same symbol" do
      class Board1 < Board
        private def default_grid
          [["X", 2, 3], ["X", 5, 6], ["X", 8, 9]]
        end
      end
      board1 = Board1.new
      game = Handlers.new(board1)
      expect(game.game_over?(player)).to eql(:winner)
    end

    it "Returns :winner if the second column is filled with the same symbol" do
      class Board1 < Board
        private def default_grid
          [[1, "X", 3], [4, "X", 6], [7, "X", 9]]
        end
      end
      board1 = Board1.new
      game = Handlers.new(board1)
      expect(game.game_over?(player)).to eql(:winner)
    end

    it "Returns :winner if the third column is filled with the same symbol" do
      class Board1 < Board
        private def default_grid
          [[1, 2, "X"], [4, 5, "X"], [7, 8, "X"]]
        end
      end
      board1 = Board1.new
      game = Handlers.new(board1)
      expect(game.game_over?(player)).to eql(:winner)
    end

    it "Returns :winner if a diagonal is filled with the same symbol" do
      class Board1 < Board
        private def default_grid
          [["X", 2, 3], [4, "X", 6], [7, 8, "X"]]
        end
      end
      board1 = Board1.new
      game = Handlers.new(board1)
      expect(game.game_over?(player)).to eql(:winner)
    end

    it "Returns :winner if the other diagonal is filled with the same symbol" do
      class Board1 < Board
        private def default_grid
          [[1, 2, "X"], [4, "X", 6], ["X", 8, 9]]
        end
      end
      board1 = Board1.new
      game = Handlers.new(board1)
      expect(game.game_over?(player)).to eql(:winner)
    end

    it "Returns :draw if all cells are filled and there's not a winner" do
      class Board1 < Board
        private def default_grid
          [["X", "O", "X"], ["O", "X", "X"], ["O", "X", "O"]]
        end
      end
      board1 = Board1.new
      game = Handlers.new(board1)
      expect(game.game_over?(player)).to eql(:draw)
    end


  end
end
