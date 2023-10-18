# frozen_string_literal: true

# Represents the knight; new knights are initialized with their parent
class Knight
  attr_reader :position, :parent

  @@visited_positions = []

  def self.visited_positions
    @@visited_positions
  end

  def initialize(position, parent = nil)
    @position = position
    @@visited_positions << position
    
    @parent = parent
  end

  def count_moves
    path.length - 1
  end

  def path
    unless @parent.nil?
      @parent.path << @position
    else
      [@position]
    end
  end
end
