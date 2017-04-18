require 'oystercard'

describe Oystercard do

  it 'assigns a balance to new card that can be accessed out of class' do
    expect(subject.balance).to eq 0
  end

end
