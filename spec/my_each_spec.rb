require 'spec_helper'
require './src/enumerables'

describe 'my_each' do
  it 'should iterate over arrays and the number of iterations must be the same as the array size' do
    arr = [1, 2, 3, 4, 5]
    count = 0
    arr.my_each { count += 1 }
    expect(count).to eql(arr.size)
  end

  it 'should provide the correct arrray items as the first argument to the provided block' do
    arr = [1, 2, 3, 4, 5]
    result = []
    arr.my_each { |x| result << x }
    expect(arr).to eql(result)
  end

  it 'should return a enumerator when not provided with a block' do
    expect([1].my_each).to be_an Enumerator
  end

  it 'should return the enumerable that\'s being operated on' do
    expect([1].my_each {}).to eql([1])
  end

  it 'should work with hashes' do
    res = []
    { a: 'a', b: 'b' }.my_each { |x| res << x[1] }
    expect(res).to eql(%w[a b])
  end

  it 'should work with ranges' do
    res = []
    (1..5).my_each { |x| res << x }
    expect(res).to eql([1, 2, 3, 4, 5])
  end
end
