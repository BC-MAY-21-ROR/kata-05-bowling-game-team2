# frozen_string_literal: true

require 'rspec'
require 'spec_helper'
require './lib/bowling_game'
require './lib/frame'


 describe BowlingGame do
   before :all do
    @game = BowlingGame.new
    @game.play
    @frames = @game.frames
   end
   it 'Game play' do
    score = 0
    @frames.each do |frame|
      score += frame.score #frame.strike ??? score ?
    end
    puts "Final Game Score: #{score} "
    
   end
   context 'Normal Shot' do
     skip
     it 'score is normal  when shot number 1 and shot 2 < 10 and >= 0' do
       @game.normal
       score = @game.score
       expect(score).to be_between(0, 9)
     end
     it 'has 20 shots by the end of the frame number 10' do
       total_shots = @game.shots
       expect(total_shots).to eq(20)
     end
     it 'score is 5 when shot 1 is 3 and shot 2 is 2' do
       shot_1 = @game.shot(3)
       shot_2 = @game.shot(2)
       score = shot_1.score + shot_2.score
       expect(score).to eq(5)
     end
   end
   context 'Spare Shot' do
     skip
     it 'score is 10 for a spare' do
       skip
       @game.spare
       score = @game.score
       expect(score).to eq(10)
     end
     it 'has 21 shots by the end of the frame number 10' do
       total_shots = @game.shots
       expect(total_shots).to eq(21)
     end
     it 'score is 10 when shot 1 is 3 and shot 2 is 7' do
       shot_1 = @game.shot(3)
       shot_2 = @game.shot(7)
       score = shot_1.score + shot_2.score
       expect(score).to eq(10)
     end
     it 'bonus shot is 2' do
       shot_1 = @game.shot(3)
       shot_2 = @game.shot(7)
       shot_3 = @game.shot(2)
       bonus = shot_3.score
       expect(bonus).to eq(2)
     end
     it 'score is 14 for shot 1 is 6, shot 2 is 4 and shot 3 is 4' do
       shot_1 = @game.shot(6)
       shot_2 = @game.shot(4)
       shot_3 = @game.shot(4)
       total = shot_1.score + shot_2.score
       bonus = shot_3.score
       score = total + bonus
       expect(score).to eq(14)
     end
   end
   context 'Strike Shot' do
     skip
     it 'score is 10 for a strike - knocking down all ten pins' do
       @game.strike
       score = @game.score
       expect(score).to eq(10)
     end
     it 'has 22 shots by the end of the frame number 10' do
       total_shots = @game.shots
       expect(total_shots).to eq(22)
     end
     it 'bonus shot is 6' do
       shot_1 = @game.shot(10)
       shot_2 = @game.shot(4)
       shot_3 = @game.shot(2)
       bonus = shot_2.score + shot_3.score
       expect(bonus).to eq(6)
     end
   end
 end
