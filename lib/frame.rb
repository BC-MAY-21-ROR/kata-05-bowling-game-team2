# frozen_string_literal: true

# require_relative 'cell'
class Frame
  attr_reader :bonus, :position
  def initialize(frame = 0, score = 0)
    @score = score
    @frame = frame
    @total_pines_up = 10
    @total_pines_down = 0
    @pines_down_shot_1 = 0
    @pines_down_shot_2 = 0
    @pines_down_shot_3 = 0
    @second_shot = true
    @third_shot = false
    @strike = false
    @spare = false
    @normal = true
  end

  def position
    @frame
  end

  def shot_one_score
    @pines_down_shot_1
  end

  def shot_two_score
    @pines_down_shot_2
  end

  def shot_three_score
    @pines_down_shot_3
  end

  def bonus
    if @strike
      'strike'
    elsif @spare
      'spare'
    else
      'normal'
    end
  end

  def score
    @score = @pines_down_shot_1 + @pines_down_shot_2 + @pines_down_shot_3
  end
  
  def turn
    if @frame < 10
      first_shot
      second_shot if @second_shot
      score
      @total_pines_down = @score
      @total_pines_up -= @score
    elsif @frame == 10
      first_shot
      second_shot if @second_shot
      third_shot if @third_shot
      score
      @total_pines_down = @score
      @total_pines_up -= @score
    end
  end

  def first_shot
    @pines_down_shot_1 = rand(0..10)
    strike
  end

  def second_shot
    if @strike && @frame == 10
      @pines_down_shot_2 = rand(0..10)
    else
      @pines_down_shot_2 = rand(0..(10 - @pines_down_shot_1))
      spare(@pines_down_shot_1, @pines_down_shot_2)
    end
  end

  def third_shot
    if @spare
      @pines_down_shot_3 = rand(0..10)
    end
    if @strike
      @pines_down_shot_3  = rand(0..(10 - @pines_down_shot_2))
    end
  end

  def spare(shot_one, shot_two)
    shot_1_2 = shot_one + shot_two
    if shot_1_2 == 10 && @frame == 10
      @third_shot = true
      @spare = true
    elsif shot_1_2 == 10
      @spare = true
      @third_shot = false
    else
      @spare = false
      @third_shot = false
    end
  end

  def strike
    if @frame == 10 && @pines_down_shot_1 == 10
      @strike = true
      @second_shot = true
      @third_shot = true
    elsif @pines_down_shot_1 == 10
      @second_shot = false
      @third_shot = false
      @strike = true
      @pines_down_shot_2 = 0
    else
      @second_shot = true
    end
  end
end
