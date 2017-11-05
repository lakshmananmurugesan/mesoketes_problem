class Attack
  attr_accessor :attack_count

  def initialize
    @attack_count = 0
  end

  # Check if attack happened
  def attacked? wall_strength, tribal_strength, direction
    strength = 0
    case direction
      when "N"
        strength = wall_strength.north_side
      when "S"
        strength = wall_strength.south_side
      when "E"
        strength = wall_strength.east_side
      when "W"
        strength = wall_strength.west_side
    end
    (tribal_strength > strength)
  end

  # Rebuild wall at the end of the day's battle
  def rebuild_wall wall_strength, attack_details_arr
    attack_details_arr.each do |attack_detail|
      tribal, direction, tribal_strength = attack_detail.split(" - ")
      tribal = Tribal.new(tribal, tribal_strength)
      direction = Direction.new(direction)
      strengthen_the_wall(wall_strength, tribal.tribal_strength.to_i, direction.current_direction)
    end
  end

  # Check and update wall strength
  def strengthen_the_wall wall_strength, tribal_strength, direction
    strength = 0
    case direction
      when "N"
        wall_strength.north_side = tribal_strength if (tribal_strength > wall_strength.north_side)
      when "S"
         wall_strength.south_side = tribal_strength if (tribal_strength > wall_strength.south_side)
      when "E"
         wall_strength.east_side = tribal_strength if (tribal_strength > wall_strength.east_side)
      when "W"
         wall_strength.west_side = tribal_strength if (tribal_strength > wall_strength.west_side)
      end
  end
end