class WallStrength
  attr_accessor :north_side, :south_side, :east_side, :west_side

  # Setting initial wall strength
  def initialize 
    @north_side = 0
    @south_side = 0
    @east_side = 0
    @west_side = 0
  end
end