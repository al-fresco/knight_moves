# frozen_string_literal: true

require_relative 'lib/board'

board = Board.new

def random_position_pair
  start = [rand(0..7), rand(0..7)]
  target = [rand(0..7), rand(0..7)]

  until target != start
    target = [rand(0..7), rand(0..7)]
  end

  [start, target]
end

board.knight_moves(random_position_pair[0], random_position_pair[1])
