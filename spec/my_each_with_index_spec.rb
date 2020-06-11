require 'spec_helper'
require './src/enumerables'

describe 'my_each_with_index' do
  it 'should iterate over arrays and the number of iterations must be the same as the array size' do
    arr = [1, 2, 3, 4, 5]
    count = 0
    arr.my_each_with_index { count += 1 }
    expect(count).to eql(arr.size)
  end

  it 'should provide the correct array items as the first argument to the provided block' do
    arr = [1, 2, 3, 4, 5]
    result = []
    arr.my_each_with_index { |x| result << x }
    expect(arr).to eql(result)
  end

  it 'should provide the correct index as the second argument while looping' do
    arr = [1, 2, 3, 4, 5]
    indices = []
    arr.my_each_with_index { |_, i| indices << i }
    expect(indices).to eql(0.upto(arr.size - 1).to_a)
  end

  it 'should return a enumerator when not provided with a block' do
    expect([1].my_each_with_index).to be_an Enumerator
  end
end
