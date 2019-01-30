require 'rspec'
ARGV.replace ["./spec/text.txt"]
require './lib/toyrobot.rb'
require 'pry'

RSpec.describe ToyRobot do
  context 'importing file' do
    it "reads file name" do
      toy = ToyRobot.new("./spec/text.txt")
      expect(toy.filename).to eq("./spec/text.txt")
    end
  end
end
