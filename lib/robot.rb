require 'pry'

DIRECTIONS = ['NORTH', 'EAST', 'SOUTH', 'WEST']

class Robot
  attr_reader :x, :y, :f

  def initialize(x, y, f)
    valid_position = (x.between?(0, 4) && y.between?(0, 4) && DIRECTIONS.include?(f))
    raise ArgumentError, 'Invaid coordinate inputs' unless valid_position

    @x = x
    @y = y
    @f = f
  end

  def report
    "I am at X: #{x}, Y: #{y} facing #{f}"
  end

  def move
    if @f == 'NORTH' && @y < 4
      @y += 1
    elsif @f == 'SOUTH' && @y > 0
      @y -= 1
    elsif @f == 'EAST' && @x < 4
      @x += 1
    elsif @f == 'WEST' && @x > 0
      @x -= 1
    else
      "Invalid move"
    end
  end

  def left
    return @f = 'WEST' if @f == 'NORTH'
    return @f = 'SOUTH' if @f == 'WEST'
    return @f = 'EAST' if @f == 'SOUTH'
    return @f = 'NORTH' if @f == 'EAST'
  end

  def right
    return @f = 'EAST' if @f == 'NORTH'
    return @f = 'NORTH' if @f == 'WEST'
    return @f = 'WEST' if @f == 'SOUTH'
    return @f = 'SOUTH' if @f == 'EAST'
  end
end
