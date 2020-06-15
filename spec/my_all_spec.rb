require 'spec_helper'
require './src/enumerables'

describe 'my_all?' do
  it 'should iterate over arrays and the number of iterations must be the same as the array size' do
    arr = [1, 2, 3, 4, 5]
    count = 0
    arr.my_all? { count += 1 }
    expect(count).to eql(arr.size)
  end

  it 'should provide the correct array items as the first argument to the provided block' do
    arr = [1, 2, 3, 4, 5]
    result = []
    arr.my_all? { |x| result << x }
    expect(arr).to eql(result)
  end

  it 'should should return the correct boolean value when not provided with a block' do
    arr = [1, 2, false, nil, 5]
    expect(arr.my_all?).to eql(false)
    arr = [true, 1, '', [], {}]
    expect(arr.my_all?).to eql(true)
  end

  it 'should return the correct boolean value when provided with a block' do
    arr = [1, 2, 3, 4, 5]
    expect(arr.my_all? { |x| x > 3 }).to eql(false)
    expect(arr.my_all? { |x| x.is_a? Numeric }).to eql(true)
  end

  it 'should return the correct boolean value when provided with a regular expression' do
    arr = [1, 2, 3, 4, 5]
    expect(arr.my_all?(/^\d$/)).to eql(true)
    expect(arr.my_all?(/^ff$/)).to eql(false)
  end

  it 'should return the correct boolean value when provided with a function' do
    arr = [1, 2, 3, 4]
    expect(arr.my_all?(Numeric)).to eql(true)
    expect(arr.my_all?(&:odd?)).to eql(false)
    arr = [1, true, 2]
    expect(arr.my_all?(Numeric)).to eql(false)
    arr = [{}, {}, []]
    expect(arr.my_all?(Object)).to eql(true)
  end
end
