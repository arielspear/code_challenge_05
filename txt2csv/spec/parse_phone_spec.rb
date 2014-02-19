require 'spec_helper'

require 'parse.rb'

#     [country] [area] [head] [body] [tail] [extension]

describe Parse do

  it 'should parse extensions' do
    return_array = Parse.parse_phone('(123)555-4567 x8910')
    expect(return_array).to eq(['','123','555', '4567','8910'])
  end

  it 'should parse country code' do
    return_array = Parse.parse_phone('1(123)555-4567')
    expect(return_array).to eq(['1','123','555', '4567',''])
  end

  it 'should parse country code with extensions' do
    return_array = Parse.parse_phone('1(123)555-4567 x8910')
    expect(return_array).to eq(['1','123','555', '4567','8910'])
  end

  it 'should parse code with()' do
    return_array = Parse.parse_phone('(123)555-4567')
    expect(return_array).to eq(['','123','555', '4567',''])
  end

  it 'should parse code with-' do
    return_array = Parse.parse_phone('123-555-4567')
    expect(return_array).to eq(['','123','555', '4567',''])
  end

  it 'should parse code with.' do
    return_array = Parse.parse_phone('123.555.4567')
    expect(return_array).to eq(['','123','555', '4567',''])
  end

end
