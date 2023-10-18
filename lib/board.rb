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

  def knight_moves(start_position, target_position, queue = [Knight.new(start_position)])
    knight = queue.shift
    
    if knight.path[-1] == target_position
      p "You made it from #{start_position} to #{target_position} in #{knight.count_moves} moves!"
      p "The path was: #{knight.path}"
      return
    else
      child_coordinates = find_adjacent_coordinates(knight)
      
      child_coordinates.each do |coordinates|
        queue << Knight.new(coordinates, knight)
      end

      knight_moves(start_position, target_position, queue.compact)
    end
  end

  private

  def find_adjacent_coordinates(knight)
    adjacent_coordinates = []
    
    TRANSFORMATIONS.each do |set|
      adjacent_coordinates << [set[0] + knight.position[0], set[1] + knight.position[1]]
    end

    adjacent_coordinates.reject do |coordinates|
      coordinates.any? { |coordinate| !coordinate.between?(0, 7) } ||
      Knight.visited_positions.include?(coordinates)
    end
  end
end

# Breadth-First Traversal
# Place a new Knight on every square that can be reached from the root (starting square) in one move
# Push these square coordinates to an array containing visited squares
# For each of these knights, move a new knight to each of their unvisited children (adjacent squares)
