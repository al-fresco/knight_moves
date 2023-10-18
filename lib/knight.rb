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
    count = (path.length - 1).to_s.yellow
    return "#{count} move" if count == 1
    "#{count} moves"
  end

  def path
    unless @parent.nil?
      @parent.path << @position
    else
      [@position]
    end
  end

  def print_path
    puts "You made it from #{colorize_path[0]} to #{colorize_path[-1]} in #{count_moves}!"
    colorize_path.each do |position|
      unless position == colorize_path.last
        print "#{position} --> "
      else
        print "#{position}\n\n"
      end
    end
  end

  def colorize_path
    path.map do |position|
      if position == path.first
        position.to_s.red
      elsif position == path.last
        position.to_s.green
      else
        position.to_s.yellow
      end
    end
  end
end
