require 'spec_helper'

require 'parse.rb'

describe Parse do

  it 'should parse correct emails' do
    return_array = Parse.parse_email('email@domain.com')
    expect(return_array).to eq(['email@domain.com'])
  end

  it 'should parse correct emails with dots' do
    return_array = Parse.parse_email('name.email@domain.com')
    expect(return_array).to eq(['name.email@domain.com'])
  end

  it 'should error if no name' do
    return_array = Parse.parse_email('@domain.com')
    expect(return_array).to eq(['Not Found'])
  end

  it 'should error if no @' do
    return_array = Parse.parse_email('namedomain.com')
    expect(return_array).to eq(['Not Found'])
  end

  it 'should error if no domain' do
    return_array = Parse.parse_email('name.com')
    expect(return_array).to eq(['Not Found'])
  end

  it 'should error if no .___' do
    return_array = Parse.parse_email('name@domain')
    expect(return_array).to eq(['Not Found'])
  end
end
