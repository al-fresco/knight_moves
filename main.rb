# frozen_string_literal: true

require_relative 'lib/board'

board = Board.new
board.knight_moves([3, 3], [7, 3])
