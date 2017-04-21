require './lib/balance.rb'

describe Balance do
  describe '#oystercard balance class can have value attributed and altered' do
    it 'assigns a balance of 0 to new card that can be accessed' do
      expect(subject.value).to eq 0
    end

    it 'allows balance to be topped up' do
      expect(subject.top_up(5)).to eq subject.value
    end

    it "checks that balance cannot go above MAX_BALANCE of #{Balance::MAX_BALANCE}" do
      message = "Balance cannot exceed £#{Balance::MAX_BALANCE}!"
      expect { subject.top_up(91) }.to raise_error message
    end
  end
end
