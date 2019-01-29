require 'pry'
class Robot
    attr_reader :x, :y, :f
    def self.beep
        "Beep"
    end

    def initialize(x, y, f)
        @x = x
        @y = y
        @f = f
    end

    def report
        "I am at X: #{x}, Y: #{y} facing #{f}"
    end
end