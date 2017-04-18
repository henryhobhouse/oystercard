require 'oystercard'

describe Oystercard do

  it 'assigns a balance to new card that can be accessed out of class' do
    expect(subject.balance).to eq 0
  end

  it 'allows oystercard to be topped up' do
    expect(subject.top_up(5)).to eq subject.balance
  end

end
