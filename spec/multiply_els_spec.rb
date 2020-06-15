require 'spec_helper'
require './src/enumerables'

describe 'my_count' do
  it 'should multiply array elements and return the result' do
    expect(multiply_els([1, 2, 3, 4])).to eql(24)
    expect(multiply_els(1..5)).to eql(120)
  end
end
