require 'pry'

class ToyRobot
    attr_reader :filename
    
    def initialize
        # binding.pry
        @filename = ARGV[0]
    end
end
