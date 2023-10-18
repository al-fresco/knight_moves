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

  def move_count_string
    count = path.length - 1
    
    if count == 1
      "#{count.to_s.yellow} move"
    else
      "#{count.to_s.yellow} moves"
    end
  end

  def path
    unless @parent.nil?
      @parent.path << @position
    else
      [@position]
    end
  end

  def print_path
    print "The knight made it from #{colorized_path[0]} to #{colorized_path[-1]} in #{move_count_string}!\n\n"
    colorized_path.each do |position|
      unless position == colorized_path.last
        print "#{position} --> "
      else
        print "#{position}\n\n"
      end
    end
  end

  def colorized_path
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
