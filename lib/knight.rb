# frozen_string_literal: true

# Represents the knight
class Knight
  attr_reader :position, :path

  @@viable_paths = []

  def initialize(start)
    @start = start
    @path = [start]
  end

  def depth
    @path.length
  end

  def move_to(position)
    @path << position
  end
end
