require 'rspec'
require './src/toyrobot.rb'

RSpec.describe ToyRobot do
    it "reads file name" do
        ARGV.replace ["text.txt"]
        toy = ToyRobot.new
        expect(toy.filename).to eq("text.txt")
    end 
end