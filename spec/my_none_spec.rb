require 'spec_helper'
require './src/enumerables'

describe 'my_none?' do
  it 'should return the correct boolean value when not provided with a block' do
    arr = [false, nil]
    expect(arr.my_none?).to eql(true)
    arr = [true, false, '', [], {}]
    expect(arr.my_none?).to eql(false)
  end

  it 'should return the correct boolean value when provided with a block' do
    arr = [1, 2, 3, 4, 5]
    expect(arr.my_none? { |x| x > 1 }).to eql(false)
    expect(arr.my_none? { |x| x > 10 }).to eql(true)
  end

  it 'should return the correct boolean value when provided with a regular expression' do
    arr = [1, 2, 3, 4, 5]
    expect(arr.my_none?(/^5$/)).to eql(false)
    expect(arr.my_none?(/^\d{5}$/)).to eql(true)
  end

  it 'should return the correct boolean value when provided with a function' do
    arr = [1, 2, 3, 4]
    expect(arr.my_none?(Numeric)).to eql(false)
    expect(arr.my_none?(&:even?)).to eql(false)
    arr = [nil, true, '']
    expect(arr.my_none?(Numeric)).to eql(true)
    arr = [{}, {}, []]
    expect(arr.my_none?(Object)).to eql(false)
  end
end
