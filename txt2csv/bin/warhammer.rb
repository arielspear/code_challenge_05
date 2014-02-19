#!/usr/bin/env ruby
# this first line is how the operating system knows to use ruby to execute this file
# use chmod u+x warhammer to make sure the file is executable

require 'thor'
require_relative '../lib/parse.rb'

class WarHammer < Thor
  desc "Hello NAME", "Thor is nice to NAME"
  def hello (name)
    puts "Hello #{name}, I am Thor."
  end

  desc "Takes raw data, cleans and puts into CSV"
  def convert(prefix, suffix, input, output)
    puts "ruby lib/parse.rb <input >#file.path{output}"
    # `ruby lib/parse.rb <input >output`
  end

end # class WarHammer


WarHammer.start
