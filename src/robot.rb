require 'pry'

DIRECTIONS = ["NORTH", "SOUTH", "EAST", "WEST"]


class Robot
    attr_reader :x, :y, :f
    def self.beep
        "Beep"
    end

    def initialize(x, y, f)
        if (x.between?(0,5) && y.between?(0,5) && DIRECTIONS.include?(f) )
            @x = x
            @y = y
            @f = f
        else
            raise ArgumentError, "Invaid coordinate inputs"
        end
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
end