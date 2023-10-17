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

  def find_children_of(position)
    children = []
    
    TRANSFORMATIONS.each do |set|
      children << [set[0] + position[0], set[1] + position[1]]
    end

    children.reject { |child| !child[0].between?(0, 7) || !child[1].between?(0, 7) }
  end

  # Returns the shortest path from the starting position to the target position
  def knight_moves(start_position, target_position)
    # Create a new Knight at start_position
    knight = Knight.new
    # Find children (adjacent positions) of start_position 
    # Traverse each branch one by one, stopping if the depth is 6 or the target is found
    # If target is reached, add Knight's path to the Knight class's @@viable_paths attribute
    # Repeat until all branches have been explored

    # 
  end
end
