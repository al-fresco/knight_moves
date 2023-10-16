# frozen_string_literal: true

require_relative 'lib/board'
require_relative 'lib/knight'

board = Board.new
p board.coordinates

knight = Knight.new([0, 0])
p knight.position
p knight.visited
