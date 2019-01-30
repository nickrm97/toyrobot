require 'rspec'
ARGV.replace ["./spec/text.txt"]
require './src/toyrobot.rb'
require 'pry'

RSpec.describe ToyRobot do
  context 'importing file' do
    it "reads file name" do
      ARGV.replace ["./spec/text.txt"]
      toy = ToyRobot.new
      expect(toy.filename).to eq("./spec/text.txt")
    end
  end
end
