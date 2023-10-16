# frozen_string_literal: true

# Represents the knight
class Knight
  attr_reader :position, :visited

  def initialize(position, visited = [])
    @position = position
    @visited = visited
  end

  def distance_traveled
    @visited.length
  end
end
