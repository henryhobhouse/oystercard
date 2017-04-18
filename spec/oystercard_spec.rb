require 'oystercard'

describe Oystercard do

  it 'assigns a balance to new card that can be accessed out of class' do
    expect(subject.balance).to eq 0
  end

  it 'allows oystercard to be topped up' do
    expect(subject.top_up(5)).to eq subject.balance
  end

  it 'checks that balance cannot go above 90' do
    expect { subject.top_up(91) }.to raise_error "Balance cannot exceed £90!"
  end

  it 'will deduct passed fare amount from balance' do
    subject.top_up(15)
    subject.deduct(10)
    expect( subject.balance ).to eq 5
  end

end
