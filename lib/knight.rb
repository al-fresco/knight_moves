# frozen_string_literal: true

# Represents the knight
class Knight
  attr_reader :position, :path, :current_position

  @@all_paths = []

  def self.shortest_path
    @@viable_paths.min_by { |path| path.length }.first
  end

  def initialize(start)
    @start = start
    @current_position = start
    @path = [start]
  end

  def depth
    @path.length - 1
  end

  def move_to(position)
    @current_position = position
    @path << position
  end

  def add_path
    @@all_paths << @path
  end
end
