# require_relative 'cell'
class Frame
    def initialize(frame=0, score=0)
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

    def score
        @score = @pines_down_shot_1 + @pines_down_shot_2 + @pines_down_shot_3
    end
    def turn
        if @frame < 10 
          self.first_shot
          self.second_shot if @second_shot 
          self.score
          @total_pines_down = @score 
          @total_pines_up = @total_pines_up - @score 
        elsif @frame == 10 
          self.first_shot
          self.second_shot if @second_shot 
          self.third_shot if @third_shot 
          self.score
          @total_pines_down = @score 
          @total_pines_up = @total_pines_up - @score 
        end
    end
    def first_shot
        pines_down = rand(0..10)
        @pines_down_shot_1 = pines_down
        self.strike
    end
    def second_shot
        if @strike && @frame == 10
           pines_down = rand(0..10)
           @pines_down_shot_2 =  pines_down
        else
          pines_down = rand(0..(10 - @pines_down_shot_1))
          @pines_down_shot_2 =  pines_down
          self.spare( @pines_down_shot_1, @pines_down_shot_2)
        end
    end
    def third_shot
      @pines_down_shot_3 = 0
      if @spare 
         pines_down = rand(0..10)
         @pines_down_shot_3 = pines_down
      end
      if @strike
         pines_down = rand(0..(10 - @pines_down_shot_2))
         @pines_down_shot_3 = pines_down
      end
    end
    def spare(shot_1,shot_2)
      shot_1_2 = shot_1 + shot_2
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
         @second_shot =  false
         @third_shot = false
         @strike = true 
      else
        @second_shot = true
      end
    end

end