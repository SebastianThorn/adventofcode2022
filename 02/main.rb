#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

input = IO.read("input")
# input = IO.read("input_ex")

def result_from_round(enemy, hero)

  if
    (enemy == :rock    and hero == :paper) or
    (enemy == :scissor and hero == :rock) or
    (enemy == :paper   and hero == :scissor)

    puts "WIN!"
    puts "#{hero} beats #{enemy}"
    return 6
  elsif enemy == hero
    puts "DRAW!"
    puts "#{enemy} is #{hero}"
    return 3
  else
    puts "LOSS!"
    puts "#{enemy} beats #{hero}"
    return 0
  end

end

puts "\n#\n# Input"
puts input

tokens = {
  "A" => {points: 0, action: :rock},
  "B" => {points: 0, action: :paper},
  "C" => {points: 0, action: :scissor},
  "X" => {points: 1, action: :rock},
  "Y" => {points: 2, action: :paper},
  "Z" => {points: 3, action: :scissor}
}

pp tokens

# In the first round, your opponent will choose Rock (A), and you should choose Paper (Y). This ends in a win for you with a score of 8 (2 because you chose Paper + 6 because you won).
# In the second round, your opponent will choose Paper (B), and you should choose Rock (X).

# 0 if you lost
# 3 if the round was a draw
# 6 if you won

rounds = Array.new
rounds2 = Array.new

input.split("\n").each_with_index do |round, i|
  puts "\nRound #{i}"
  puts "########"
  pp round

  enemy, hero = round.split

  puts "Enemy: #{enemy}, #{tokens[enemy]}"
  puts "Hero:  #{hero}, #{tokens[hero]}"

  result_point = result_from_round(tokens[enemy][:action], tokens[hero][:action])
  action_point = tokens[hero][:points]
  round_points = result_point + action_point

  rounds.push(round_points)

  puts "Round-sum: #{round_points}"

end

total_points = rounds.sum

puts "\n#\n#"
puts "Total-sum: #{total_points}"
