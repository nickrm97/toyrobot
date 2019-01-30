require 'pry'
require_relative './robot.rb'

class ToyRobot
    attr_reader :filename, :robot
    
    def initialize
        if File.file?(ARGV[0])
            @filename = ARGV[0]
            @robot = nil
            handle_file
        else
            @filename = nil
        end
    end

    def handle_file
        placed = false
        File.readlines(@filename).map(&:chomp).each_with_index do |line, index|
            if line.include?("PLACE") && !placed
                placement = line.split(' ')[1].split(',')
                begin
                    @robot = Robot.new(placement[0].to_i, placement[1].to_i, placement[2])
            rescue ArgumentError
                next
            end
                    placed = true
                end

            if placed
                if line == "MOVE"
                    @robot.move
                elsif line == "LEFT"
                    @robot.left
                elsif line == "RIGHT"
                    @robot.right 
                elsif line == "REPORT"
                    @robot.report 
                else
                    "Invalid line: #{line}"
                end
            end
        end
    end
end

toy = ToyRobot.new