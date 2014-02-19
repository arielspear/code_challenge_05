require 'spec_helper'

require 'parse.rb'

describe Parse do

  it 'should parse with @' do
    return_array = Parse.parse_twitter('@twitter')
    expect(return_array).to eq(['twitter'])
  end

  it 'should parse without @' do
    return_array = Parse.parse_twitter('twitter')
    expect(return_array).to eq(['twitter'])
  end
end
