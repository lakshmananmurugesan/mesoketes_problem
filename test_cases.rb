require './attack.rb'
require './wall_strength.rb'
require './helper.rb'

class TestCases
  # with the problem statement input
  def usual_input
    [
     'T1 - N - 3: T2 - S - 4: T3 - W - 2',
     'T1 - E - 4: T2 - N - 3: T3 - S - 2',
     'T1 - W - 3: T2 - E - 5: T3 - N - 2'
    ]
  end

  # with same directions repeated
  def multiple_same_direction_input
    [
     'T1 - N - 3: T2 - N - 4: T3 - N - 12',
     'T1 - N - 41: T2 - N - 113: T3 - N - 202',
     'T1 - N - -3: T2 - N - 510: T3 - N - 67'
    ]
  end

  # with long random input
  def long_input
    [
      'T1 - S - 10: T1 - N - 10: T3 - W - 10: T3 - W - 11: T3 - S - 11: T3 - N - 13: T1 - E - 2: T1 - E - 100: T1 - E - 112: T1 - E - -2',
      'T2 - S - 500: T2 - N - 124: T3 - N - 300',
      'T1 - W - 223: T1 - W - -41: T2 - N - 38: T2 - S - 40'
    ]
  end

  # run test
  def test_run
    attack = Attack.new
    wall_strength = WallStrength.new
    long_input.each do |test_input|
      Helper.new.parse_attack_details(attack, wall_strength, test_input)
    end
    puts "Attack count is #{attack.attack_count}"
  end

  test = TestCases.new
  test.test_run
end