require 'spec_helper'
require './src/enumerables'

describe 'my_count' do
  it 'should return the correct length of the array when not provided with a block' do
    arr = [false, nil]
    expect(arr.my_count).to eql(2)
    arr = [true, false, '', [], {}]
    expect(arr.my_count).to eql(5)
  end

  it 'should return the correct value value when provided with a block' do
    arr = [1, 2, 3, 4, 5]
    expect(arr.my_count { |x| x > 1 }).to eql(4)
    expect(arr.my_count { |x| x > 10 }).to eql(0)
  end

  it 'should return the correct length when provided with a value' do
    arr = [1, 2, 3, 4]
    expect(arr.my_count(4)).to eql(1)
    arr = [true, true, '']
    expect(arr.my_count(true)).to eql(2)
    arr = [{}, {}, []]
    expect(arr.my_count([])).to eql(1)
  end

  it 'should work with ranges' do
    expect((1..5).my_count).to eql(5)
    expect((1..5).my_count { |x| x < 10 }).to eql(5)
  end
end
