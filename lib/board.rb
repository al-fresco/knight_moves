# frozen_string_literal: true

require_relative 'knight'

# Represents the chess board; initializes with an empty of array of visited nodes; contains the #knight_moves method
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

  def initialize
    @visited_positions = []
    @knights = []
  end

  def knight_moves(start_position, target_position, queue = [start_position])
    # Create knight
    
    if position == target_position
      p "You made it from #{knight.path[0]} to #{knight.path[-1]} in #{knight.count_moves} moves!"
      p "The path was: #{knight.path}"
      return
    else
      # Queue children, call #knight_moves
    end
  end

  private

  def find_children_of(position)
    children = []
    
    TRANSFORMATIONS.each do |set|
      children << [set[0] + position[0], set[1] + position[1]]
    end

    children.reject do |child|
      child.any? { |coordinate| !coordinate.between?(0, 7) } ||
      @visited_positions.include?(child)
    end
  end

  def find_knight_at(position)
    @knights.find { |knight| knight.path[-1] == position }
  end
end

# Breadth-First Traversal
# Place a new Knight on every square that can be reached from the root (starting square) in one move
# Push these square coordinates to an array containing visited squares
# For each of these knights, move a new knight to each of their unvisited children (adjacent squares)
