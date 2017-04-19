require 'oystercard'

describe Oystercard do

  it 'assigns a balance of 0 to new card that can be accessed' do
    expect(subject.balance).to eq 0
  end

  it 'allows oystercard to be topped up' do
    expect(subject.top_up(5)).to eq subject.balance
  end

  it "checks that balance cannot go above #{Oystercard::MAX_BALANCE}" do
    expect { subject.top_up(91) }.to raise_error "Balance cannot exceed £#{Oystercard::MAX_BALANCE}!"
  end

  it 'will deduct passed fare amount from balance' do
    subject.top_up(15)
    expect { subject.deduct(10) }.to change { subject.balance }.by(-10)
  end

  describe '#in_journey state changes' do

    before { subject.top_up(10) }
    it 'will have in_journey return false on oystercard creation' do
      expect(subject.in_journey?).to eq false
    end
    it 'will alter in-journey to true if touch_in is called' do
      expect { subject.touch_in }.to change { subject.in_journey? }.to true
    end
    it 'will make in_journey false if touch_out called' do
      subject.touch_in
      expect { subject.touch_out }.to change { subject.in_journey? }.to false
    end

  end

  describe '#raise error if balance too low' do

    it "will raise error if touch_in is called with balance below £#{Oystercard::MIN_BALANCE}" do
      expect { subject.touch_in }.to raise_error "balance too low!"
    end

  end

  describe '#Will deduct fare amount on touch_out' do

    before { subject.top_up(10) }
    it "will deduct £#{Oystercard::MIN_FARE} upon touch_out" do
      subject.touch_in
      expect { subject.touch_out }.to change { subject.balance }.by(-Oystercard::MIN_FARE)
    end

  end

end
