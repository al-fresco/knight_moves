# frozen_string_literal: true

# Represents the chess board
class Board
  attr_reader :coordinates

  def initialize
    @coordinates = generate_coordinates
  end

  private

  def generate_coordinates
    x = 0
    y = 0
    coordinates = []

    64.times do
      if x == 7
        coordinates << [x, y]

        x, y = 0, y + 1
      else
        coordinates << [x, y]

        x += 1
      end
    end

    coordinates
  end
end
