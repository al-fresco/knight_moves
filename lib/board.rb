# frozen_string_literal: true

require 'colorize'

require_relative 'knight'

# Represents the chess board
class Board
  MATRIX = Board.generate_matrix

  attr_reader :matrix

  def self.generate_matrix
    [0, 1, 2, 3, 4, 5, 6, 7].repeated_permutation(2).to_a
  end

  def initialize(start, target)
    @matrix = MATRIX

    @start = start
    @target = target
    @visited_positions = []
  end

  def print
    @matrix.each do |position|
      str = position.to_s

      if position == @start
        str = str.red
      elsif position == @target
        str = str.yellow
      end

      if position[0] == 7
        super("#{str}\n")
      else
        super("#{str} ")
      end
    end
  end

  private

  def find_neighbors_of(position)
    array = []

    TRANSFORMATIONS.each do |trans|
      array << [trans[0] + @position[0], trans[1] + @position[1]]
    end

    array.keep_if do |neighbor|
      neighbor.all? { |value| value.between?(0, 7) }
    end
  end
end
