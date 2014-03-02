#! /usr/bin/env ruby

# sets variables and grabs first or last word depending on commands
class Analyze
  def initialize(inputfile, outputfile, pattern_select)
    @input = File.new(inputfile, 'r')
    @output = File.new(outputfile, 'w')
    @pattern_select = pattern_select
  end

  def pattern
      # looks at @pattern_select
      case @pattern_select
          # if pattern == p, sets sorter to first word
        when '-p'
          sorter = /^\S*/
      # if pattern == s, sets sorter to last word
        when '-s'
          sorter = /\S*$/
      end
    return sorter
  end

  def histo_maker
    # instanciates histogram
    histogram = Hash.new(0)
    sorter = pattern
    # for each input compair the line to the sorter,
    # if they match add 1 to the histogram
    @input.each_line do |line|
      # makes array of each line with 4 parts
      histo_array = line.split("\t")
      # declares the first part of the array as part_of_name
      part_of_name = histo_array[0].to_s
      # sets word as the match of the regex pattern on the name element
      word = sorter.match(part_of_name).to_s
      # adds to count of histogram
      histogram[word.to_sym] += 1
    end

    histogram = Hash[histogram.sort_by { |word, count| count }.reverse]
    histogram.each { |word, count| @output.puts "#{word} #{count}" }
  end
end
