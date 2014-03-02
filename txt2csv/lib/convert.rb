require 'csv'
require_relative 'parse.rb'
class Convert
  def initialize(input_file, output_file, prefix_file, suffix_file)
    @input_file = File.new(input_file, 'r')
    @output_file = File.new(output_file, 'w')
    @prefix_file = File.new(prefix_file, 'r')
    @suffix_file = File.new(suffix_file, 'r')
    @prefixes_array = []
    @suffixes_array = []
  end

  def set_ixes
#    @prefixes_file = ['M.', 'Mrs.', 'Mr.', 'Dr.', 'Ms.', 'Sister', 'Lady']
#    @suffixes_file = %w(Jr. Sr. II III IV PhD.)
    @prefixes_file.each_line do |line|
      @prefixes_array << line
    end
    @suffixes_file.each_line do |line|
      @suffixes_array << line
    end
  end

  def convert_parse(line)
    CSV.open(@output_file, 'w', :write_headers=> true, :headers => ['Name','Phone Number','Twitter', 'Email']) do |csv|
      csv << nil
    end
    # for each line
    @input_file.each_line do |line|
      # split at tabs
      convert_data = line.split("\t")
      # make an array
      parsed_data = []
      # shove parsed stuff into the array
      parsed_data[] << Parse.parse_name(prefixes_array, suffixes_array, name_string)
      parsed_data[] << Parse.parse_phone(phone_string)
      parsed_data[] << Parse.parse_twitter(twitter_string)
      parsed_data[] << Parse.parse_email(email_string)
      # rite the array into the output, and put spaces where the commas are
      @output_file.puts(parsed_data.join(" "))
    end
  end
end
