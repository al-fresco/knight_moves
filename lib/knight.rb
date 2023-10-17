# frozen_string_literal: true

# Represents the knight; new knights are initialized with their parent's path
class Knight
  attr_reader :path

  def initialize(parent_path = [])
    @path = parent_path
  end

  def visit(position)
    @path << position
  end

  def count_moves
    @path.length - 1
  end
end
