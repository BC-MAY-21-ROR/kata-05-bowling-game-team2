# frozen_string_literal: true

class BowlingGame
  def initialize
    @shots = Array.new(10) { Array.new(3) }
  end

  def strike; end

  def spare; end

  def normal; end
end
