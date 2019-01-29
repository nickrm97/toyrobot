require 'rspec'
require './src/robot.rb'

RSpec.describe Robot do
    it "can beep" do
        expect(Robot.beep).to eq("Beep")
    end 
end