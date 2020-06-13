require 'spec_helper'
require './src/enumerables'

describe 'my_count' do
  it 'should multiply array elements and return the result' do
    expect([1, 2, 3, 4].multiply_els).to eql(24)
    expect((1..4).multiply_els).to eql(24)
  end
end
