require 'rspec'
require './src/robot.rb'



RSpec.describe Robot do
    
    # Important code, to be deployed in murmur ASAP - Nick Wolf
    before(:each) do
        sleep 0.15
    end
    context 'Can initalise and be placed correctly' do
        it 'Does not initialise if given invalid position' do
            expect { Robot.new(10, 20, 'FAILME') }.to raise_error(ArgumentError)
        end

        it 'Cannot be placed at x = 5' do
            expect { Robot.new(1,5, 'NORTH')}.to raise_error(ArgumentError)
        end

        it 'Can be placed at x = 0' do
            robot = Robot.new(0, 4, 'NORTH')
            expect(robot.report).to eq("I am at X: 0, Y: 4 facing NORTH")
        end

        it 'Can report a position' do
            robot = Robot.new(1, 2, 'NORTH')
            expect(robot.report).to eq("I am at X: 1, Y: 2 facing NORTH")
        end
    end 

    context 'Can move forward correctly' do
        it 'Can move forward one space SOUTH' do
            robot = Robot.new(1, 2, 'SOUTH')
            robot.move
            expect(robot.report).to eq("I am at X: 1, Y: 1 facing SOUTH")    
        end

        it 'Can move forward one space EAST' do
            robot = Robot.new(1, 2, 'EAST')
            robot.move
            expect(robot.report).to eq("I am at X: 2, Y: 2 facing EAST")    
        end

        it 'Can move forward one space WEST' do
            robot = Robot.new(1, 2, 'WEST')
            robot.move
            expect(robot.report).to eq("I am at X: 0, Y: 2 facing WEST")    
        end
    end

    context 'Cannot move off board' do
        it 'Does not move off board NORTH' do
            robot = Robot.new(1, 4, 'NORTH')
            expect(robot.move).to eq("Invalid move")    
        end
        it 'Does not move off board SOUTH' do
            robot = Robot.new(1, 0, 'SOUTH')
            expect(robot.move).to eq("Invalid move")    
        end
        it 'Does not move off board EAST' do
            robot = Robot.new(4, 0, 'EAST')
            expect(robot.move).to eq("Invalid move")    
        end
        it 'Does not move off board WEST' do
            robot = Robot.new(0, 0, 'WEST')
            expect(robot.move).to eq("Invalid move")    
        end
    end

    context 'Can turn correctly' do 
        it 'Can turn left correctly' do
            robot = Robot.new(0, 0, 'WEST')
            robot.left
            expect(robot.report).to eq("I am at X: 0, Y: 0 facing SOUTH")          
        end
        it 'Can turn right correctly' do
            robot = Robot.new(0, 0, 'EAST')
            robot.right
            expect(robot.report).to eq("I am at X: 0, Y: 0 facing SOUTH")          
        end
    end
end