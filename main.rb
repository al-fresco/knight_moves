# frozen_string_literal: true

require_relative 'lib/board'

board = Board.new
board.knight_moves([rand(0..7), rand(0..7)], [rand(0..7), rand(0..7)])
