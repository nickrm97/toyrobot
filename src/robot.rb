require 'pry'

DIRECTIONS = ["NORTH", "EAST","SOUTH", "WEST"]


class Robot
    attr_reader :x, :y, :f

    def initialize(x, y, f)
        if (x.between?(0,4) && y.between?(0,4) && DIRECTIONS.include?(f) )
            @x = x
            @y = y
            @f = f
        else
            raise ArgumentError, "Invaid coordinate inputs"
        end
        report
    end

    def report
        puts "I am at X: #{x}, Y: #{y} facing #{f}"
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
        # puts report
    end

    def left
        if @f == 'NORTH'
            @f = 'WEST'
        elsif @f == 'WEST'
            @f = 'SOUTH'
        elsif @f == 'SOUTH'
            @f = 'EAST'
        elsif @f == 'EAST'
            @f = 'NORTH'
        end
    end

    def right
        if @f == 'NORTH'
            @f = 'EAST'
        elsif @f == 'WEST'
            @f = 'NORTH'
        elsif @f == 'SOUTH'
            @f = 'WEST'
        elsif @f == 'EAST'
            @f = 'SOUTH'
        end
    end    
end