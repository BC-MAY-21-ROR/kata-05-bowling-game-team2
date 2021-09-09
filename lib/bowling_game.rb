# frozen_string_literal: true
require_relative 'frame'
# Class of the game
class BowlingGame
  def initialize
    @game_score = 0
    @total_frames = 10
    @bonus_points = 0
    @frames = []
    (1).upto(@total_frames) { | frame |  @frames << Frame.new(frame) }
  end
  def play
    prev_score = 0 
    @frames.each do | frame | 
      frame.turn
      prev_score = frame.score
      @game_score = prev_score + @game_score
    end
  end
  def frames
    @frames
  end
  def bowling_shot
    first_shot,second_shot = normal_shot()
    #is_bonus=bonus(shot_1,shot_2)  #temp
    return first_shot,second_shot
  end
=begin
  def bonus(first_bonus_shot, second_bonus_shot)
    if first_bonus_shot==10
      return "strike"
    elsif first_bonus_shot + second_bonus_shot==10
      return "spare"
    end
  end
=end
  def normal_shot #ready
    first_normal_shot   = rand(0..10)
    second_normal_shot  = rand(0..10-first_normal_shot)
    return first_normal_shot,second_normal_shot
  end

  def fill_shot_scoreboard 
      10.times do |i|
        first_shot, second_shot = bowling_shot()
        @scoreboard[i][0] = first_shot
        @scoreboard[i][1] = second_shot
        #@scoreboard[i][2] = first_shot + second_shot
      end
  end

  def fill_total_scoreboard
      
  end

=begin
  def test #appen data in array 
    #print @shots
    #puts @shots[0][0]
    #@shots[0][0]=10
    #puts @shots[0][0]
    print @shots
    i=0
    
    while i<10 do
      j=0
      while j<3 do
      @shots[i][j]=i
      j=j+1
      end
      i=i+1
    end
    puts ""
    print @shots
  end
=end
end



