#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

input = IO.read("input")
# input = IO.read("input_ex")

# puts "\n#\n# Input"
# puts input

elfs = Hash.new

input.split("\n\n").each_with_index do |pocket, i|

  elfs["Elf number #{i}"] = {
    :pocket_sum => pocket.split.map(&:to_i).sum,
    :pockets => pocket.split.map(&:to_i)
  }

end


# puts "\n\n#\n# All Elfs"
# pp elfs


puts "\n\n#\n# Elf with most total Calories"
elf_max_calories = elfs.max_by{|k,v| v[:pocket_sum]}
pp elf_max_calories
puts "Sum: #{elf_max_calories.last[:pocket_sum]}"


puts "\n\n#\n# Top 3 Elfs with most total Calories"
elfs_2 = elfs

elf_top_x = Array.new
top_x_to_get = 3

(1..top_x_to_get).each do |i|
  elf_max_calories = elfs_2.max_by{|k,v| v[:pocket_sum]}
  elf_top_x.push(elfs_2.delete(elf_max_calories.first))
end

pp elf_top_x

# elf_top_x_sum = elf_top_x.map(&last[:pocket_sum]).sum
elf_top_x_sum = elf_top_x.map {|elf| elf[:pocket_sum]}.sum

puts "Sum: #{elf_top_x_sum}"
