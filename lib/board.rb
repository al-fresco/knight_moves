# frozen_string_literal: true

require 'colorize'

require_relative 'knight'

# Represents the chess board; initializes with an empty of array of visited nodes; contains the #knight_moves method
class Board
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
      knight.print_path
      print_matrix(knight)
    else
      child_coordinates = find_adjacent_coordinates(knight)
      
      child_coordinates.each do |coordinates|
        queue << Knight.new(coordinates, knight)
      end

      knight_moves(start_position, target_position, queue.compact)
    end
  end

  private

  def generate_matrix(x = 0, y = 0, matrix = [])
    return matrix << [x, y] if [x, y] == [7, 7]

    unless x == 7
      generate_matrix(x + 1, y, matrix << [x, y])
    else
      generate_matrix(0, y + 1, matrix << [x, y])
    end
  end

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

  def print_matrix(knight)
    generate_matrix.each do |position|
      str = colorize_string(position, knight)

      unless position[0] == 7
        print "#{str} "
      else
        print "#{str}\n"
      end
    end
  end

  def colorize_string(position, knight)
    str = position.to_s

    if position == knight.path[0]
      str = str.red
    elsif position == knight.path[-1]
      str = str.green
    elsif knight.path.include?(position)
      str = str.yellow
    else
      str
    end
  end
end

# Breadth-First Traversal
# Place a new Knight on every square that can be reached from the root (starting square) in one move
# Push these square coordinates to an array containing visited squares
# For each of these knights, move a new knight to each of their unvisited children (adjacent squares)
