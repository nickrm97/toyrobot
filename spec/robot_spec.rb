require 'rspec'
require './src/robot.rb'

RSpec.describe Robot do
    it "can beep" do
        expect(Robot.beep).to eq("Beep")
    end 

    it 'Does not initialise if given invalid position' do
        expect { Robot.new(10, 20, 'FAILME') }.to raise_error(ArgumentError)
    end

    it 'Can report a position' do
        robot = Robot.new(1, 2, 'NORTH')
        expect(robot.report).to eq("I am at X: 1, Y: 2 facing NORTH")
    end

    it 'Can move forward one space SOUTH' do
        robot = Robot.new(1, 2, 'NORTH')
        robot.move
        expect(robot.report).to eq("I am at X: 1, Y: 3 facing NORTH")    
    end

    it 'Does not move off board' do
        robot = Robot.new(1, 4, 'NORTH')
        expect(robot.move).to eq("Invalid move")    
    end

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

    it 'Can turn left correctly' do
        pending
    end
end