require 'spec_helper'
require './src/enumerables'

describe 'my_select' do
  it 'should iterate over arrays and the number of iterations must be the same as the array size' do
    arr = [1, 2, 3, 4, 5]
    count = 0
    arr.select { count += 1 }
    expect(count).to eql(arr.size)
  end

  it 'should provide the correct array items as the first argument to the provided block' do
    arr = [1, 2, 3, 4, 5]
    result = []
    arr.select { |x| result << x }
    expect(arr).to eql(result)
  end

  it 'should return a enumerator when not provided with a block' do
    expect([1].my_each).to be_an Enumerator
  end

  it 'should return the right filtered items' do
    arr = [1, 2, 3, 4, 5]
    expect(arr.select { |x| x > 3 }).to eql([4, 5])
  end
end
