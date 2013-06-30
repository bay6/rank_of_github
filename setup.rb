#!/usr/bin/env ruby 

class String
  COLORS = {
    :red => "\033[31m",
    :green => "\033[32m",
    :yellow => "\033[33m",
    :blue => "\033[34m"
  }
  def colorize(color)
    "#{COLORS[color]}#{self}\033[0m"
  end
end

puts "Checking Package Dependencies..."

[["bundle", "Bundler"], ['mongod', "MongoDB 2.0+"]].each do |item|
  puts "Checking #{item[1]}..."
  if `which #{item[0]}` == ""
    puts "#{item[1]} does not exist, please install #{item[1]}} first.".colorize(:red)
    exit
  end
end

puts ""
puts "Install gems..."
puts `bundle install`

puts "Rank of China has been installed.".colorize(:green)
