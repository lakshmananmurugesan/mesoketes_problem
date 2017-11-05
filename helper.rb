require './tribal.rb'
require './direction.rb'

class Helper
  # Parse input details
  def parse_attack_details attack, wall_strength, attack_details
    attack_details_arr = attack_details.split(":")
    attack_details_arr.each do |attack_detail|
      iterate_detail(attack_detail, attack, wall_strength)
    end
    attack.rebuild_wall(wall_strength, attack_details_arr)
  end

  # Parse individual detail
  def iterate_detail attack_detail, attack, wall_strength
    tribal, direction, tribal_strength = attack_detail.split(" - ")
    tribal = Tribal.new(tribal, tribal_strength)
    direction = Direction.new(direction)
    attacked_status = attack.attacked?(wall_strength, tribal.tribal_strength.to_i, 
                      direction.current_direction)
    attack.attack_count += 1 if attacked_status
  end
end