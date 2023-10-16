# frozen_string_literal: true

require 'colorize'

# Represents the chess board
class Board
  attr_reader :matrix

  def initialize(start, target)
    @matrix = generate_matrix

    @start = start
    @target = target
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

  def generate_matrix
    x = 0
    y = 0
    matrix = []

    64.times do
      if x == 7
        matrix << [x, y]

        x, y = 0, y + 1
      else
        matrix << [x, y]

        x += 1
      end
    end

    matrix
  end
end
