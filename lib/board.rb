# frozen_string_literal: true

require 'colorize'

require_relative 'knight'

# Represents the chess board
class Board
  MATRIX = Board.generate_matrix

  attr_reader :matrix

  def self.generate_matrix
    [0, 1, 2, 3, 4, 5, 6, 7].repeated_permutation(2).to_a
  end

  # Returns the shortest path from the starting position to the target position
  def knight_moves
    # Create a knight 
  end

  private

  def find_neighbors_of(position)
    array = []

    TRANSFORMATIONS.each do |trans|
      array << [trans[0] + @position[0], trans[1] + @position[1]]
    end

    array.keep_if do |neighbor|
      neighbor.all? { |value| value.between?(0, 7) }
    end
  end
end
