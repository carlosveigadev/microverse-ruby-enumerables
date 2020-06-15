require 'spec_helper'
require './src/enumerables'

describe 'my_inject' do
  it 'should iterate over arrays and the number of iterations\
  must be the same as the array size when provided with an initial value' do
    arr = [1, 2, 3, 4, 5]
    count = 0
    arr.my_inject(1) { count += 1 }
    expect(count).to eql(arr.size)
  end

  it 'should provide the correct array items as the second argument to the provided block' do
    arr = [1, 2, 3, 4, 5]
    result = []
    arr.my_inject(1) { |_, x| result << x }
    expect(arr).to eql(result)
  end

  it 'should throw a LocalJumpError when it is not provided with a block nor a Symbol' do
    expect { [1, 2].my_inject }.to raise_error(LocalJumpError)
  end

  it 'should work with symbols when not provided with an initial arg' do
    arr = [1, 2, 3]
    expect(arr.my_inject(:+)).to eql(6)
  end

  it 'should work with symbols when provided with an initial arg' do
    arr = [1, 2, 3]
    expect(arr.my_inject(1, :+)).to eql(7)
  end

  it 'should work with blocks when not provided with an initial arg' do
    arr = [1, 2, 3]
    expect(arr.my_inject { |acc, x| x * acc }).to eql(6)
  end

  it 'should work with blocks when provided with an initial arg' do
    arr = [1, 2, 3]
    expect(arr.my_inject(3) { |acc, x| x * acc }).to eql(18)
  end
end
