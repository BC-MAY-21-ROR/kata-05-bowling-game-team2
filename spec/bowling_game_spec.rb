# frozen_string_literal: true

require 'rspec'
require 'spec_helper'
require './lib/bowling_game'
require './lib/frame'

describe BowlingGame do
  before :all do
    @game = BowlingGame.new
    # @game.play
    # @frames = @game.frames
    # @game_score = 0
  end
  # it 'Game play' do
  #   score_prev = 0
  #   bonus_prev = ''
  #   prev_frame = nil
  #   prev_frame_init = false

  #   @frames.each do |frame|

  #     if prev_frame_init == false
  #       prev_frame = frame
  #       prev_frame_init = true
  #     end

  #     frame.turn
  #     if score_prev != 0
  #         if bonus_prev == 'strike'
  #           @game_score = @game_score + frame.score
  #         elsif bonus_prev == 'spare'
  #           @game_score = @game_score + frame.shot_one_score
  #         end
  #       score_prev = 0
  #       bonus_prev = ''
  #     end
  #     @game_score = @game_score + frame.score
  #     puts "Frame #:#{frame.position} , Style: #{frame.bonus}, Frame Score: #{frame.score}, Score Acumulado: #{@game_score}, Prev Score: #{prev_frame.score}, S1:#{frame.shot_one_score}, S2:#{frame.shot_two_score}, S3:#{frame.shot_three_score}"
  #     prev_frame = frame

  #     if frame.bonus == 'strike' || 'spare'
  #       score_prev = frame.score
  #       bonus_prev = frame.bonus
  #     end
  #   end

  # end
  it 'metodo play' do
    @game.play
  end
end
