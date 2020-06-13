require 'spec_helper'
require './src/enumerables'

describe 'my_map' do
  it 'should iterate over arrays and the number of iterations must be the same as the array size' do
    arr = [1, 2, 3, 4, 5]
    count = 0
    arr.my_map { count += 1 }
    expect(count).to eql(arr.size)
  end

  it 'should provide the correct array items as the first argument to the provided block' do
    arr = [1, 2, 3, 4, 5]
    result = []
    arr.my_map { |x| result << x }
    expect(arr).to eql(result)
  end

  it 'should return a enumerator when not provided with a block' do
    expect([1].my_map).to be_an Enumerator
  end

  it 'should return the correct output value when provided with ablock' do
    arr = [1, 2, 3, 4]
    expect(arr.my_map { |x| x * 2 }).to eql(arr.map { |x| x * 2 })
  end

  it 'should accept methods as the first argument' do
    arr = [1, 2, 3, 4]
    expect(arr.my_map(&:next)).to eql(arr.map(&:next))
  end
end
