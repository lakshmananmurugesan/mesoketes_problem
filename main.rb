require './attack.rb'
require './wall_strength.rb'
require './day.rb'
require './helper.rb'

class Main
  # Declarations
  BATTLE_DAYS = 3

  #For input
  def input
    attack = Attack.new
    wall_strength = WallStrength.new
    puts "Battle of Mesoketes"
    day = Day.new(BATTLE_DAYS)
    day.no_of_days.times do |day|
      print_detail(day)
      input = gets.chomp.strip
      break if input == 'exit'
      Helper.new.parse_attack_details(attack, wall_strength, input)
      puts ""
    end
    print_outcome(attack, wall_strength)
  end

  # Input processing
  def print_detail day
    puts "Type 'exit' for EXIT"
    puts "Enter input - Day #{day+1}"
  end
   
  # Print result
  def print_outcome attack, wall_strength
    puts "Wall Strength: 
          N-#{wall_strength.north_side}
          S-#{wall_strength.south_side}
          E-#{wall_strength.east_side}
          W-#{wall_strength.west_side}"
    puts "Attack count is #{attack.attack_count}"
  end

#Function call
main = Main.new
main.input
end