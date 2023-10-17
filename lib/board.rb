# frozen_string_literal: true

require 'colorize'

require_relative 'knight'

# Represents the chess board
class Board
  MATRIX = [0, 1, 2, 3, 4, 5, 6, 7].repeated_permutation(2).to_a
  TRANSFORMATIONS = [
    [1, 2],
    [1, -2],
    [-1, 2],
    [-1, -2],
    [2, 1],
    [2, -1],
    [-2, 1],
    [-2, -1]
  ]

  # Returns the shortest path from the starting position to the target position
  def knight_moves
    # Create a knight 
  end
end
