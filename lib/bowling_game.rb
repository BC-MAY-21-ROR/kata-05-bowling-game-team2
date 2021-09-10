# frozen_string_literal: true

require_relative 'frame'
# Class of the game
class BowlingGame
  def initialize
    @game_score = 0
    @total_frames = 10
    @bonus_points = 0
    @frames = []
    (1).upto(@total_frames) { |frame| @frames << Frame.new(frame) }
  end

  def play
    score_prev = 0
    bonus_prev = ''
    prev_frame = nil
    prev_frame_init = false
    @frames.each do |frame|
      if prev_frame_init == false
        prev_frame = frame
        prev_frame_init = true
      end
      frame.turn
      if score_prev != 0
        case bonus_prev
        when 'strike'
          @game_score += frame.score
        when 'spare'
          @game_score += frame.shot_one_score
        end
        score_prev = 0
        bonus_prev = ''
      end
      @game_score += frame.score
      puts "Frame #:#{frame.position} , Style: #{frame.bonus}, Frame Score: #{frame.score}, Score Acumulado: #{@game_score}, Prev Score: #{prev_frame.score}, S1:#{frame.shot_one_score}, S2:#{frame.shot_two_score}, S3:#{frame.shot_three_score}"
      prev_frame = frame
      if frame.bonus == 'strike' || frame.bonus == 'spare'
        score_prev = frame.score
        bonus_prev = frame.bonus
      end
    end
  end

  attr_reader :frames
end
