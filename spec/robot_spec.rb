require 'rspec'
require './src/robot.rb'

RSpec.describe Robot do
    it "can beep" do
        expect(Robot.beep).to eq("Beep")
    end 

    it 'Can report a position' do
        robot = Robot.new(1, 2, 'NORTH')
        expect(robot.report).to eq("I am at X: 1, Y: 2 facing NORTH")
    end
end