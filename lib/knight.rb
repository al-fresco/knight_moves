# frozen_string_literal: true

# Represents the knight
class Knight
  attr_reader :position, :path, :neighbors

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

  def initialize(position, path = [position])
    @position = position
    @path = path
  end

  def distance_traveled
    @path.length
  end
end
