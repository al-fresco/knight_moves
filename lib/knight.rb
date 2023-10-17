# frozen_string_literal: true

# Represents the knight
class Knight
  attr_reader :position, :path

  @@viable_paths = []

  def self.shortest_path
    @@viable_paths.min_by { |path| path.length }.first
  end

  def initialize(start)
    @start = start
    @path = [start]
  end

  def depth
    @path.length - 1
  end

  def move_to(position)
    @path << position
  end

  def add_viable_path
    @@viable_paths << @path
  end
end
