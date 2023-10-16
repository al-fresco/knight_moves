# frozen_string_literal: true

# Represents the knight
class Knight
  attr_reader :position, :visited, :neighbors

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

  def initialize(position, visited = [position])
    @position = position
    @visited = visited

    @neighbors = find_neighbors
  end

  def distance_traveled
    @visited.length
  end

  private

  def find_neighbors
    array = []
    TRANSFORMATIONS.each do |trans|
      array << [trans[0] + @position[0], trans[1] + @position[1]]
    end

    array.keep_if do |neighbor|
      !@visited.include?(neighbor) &&
      neighbor.all? { |int| int.between?(0, 7) }
    end
  end
end
