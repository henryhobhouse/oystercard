require 'oystercard'

describe Oystercard do
  describe '#oystercard can have value attributed and altered' do
    it 'assigns a balance of 0 to new card that can be accessed' do
      expect(subject.balance).to eq 0
    end

    it 'allows oystercard to be topped up' do
      expect(subject.top_up(5)).to eq subject.balance
    end

    max = Oystercard::MAX_BALANCE
    it "checks that balance cannot go above MAX_BALANCE of #{max}" do
      message = "Balance cannot exceed £#{max}!"
      expect { subject.top_up(91) }.to raise_error message
    end
  end

  describe '#in_journey state changes' do
    before { subject.top_up(10) }
    it 'will not have entry station pre journey' do
      expect(subject.instance_variable_get(:@start_station)).to eq nil
    end
  end

  describe '#raise error if balance too low on attempted touch_in' do
    it "Error on touch_in with MIN_BALANCE of £#{Oystercard::MIN_BALANCE}" do
      expect { subject.touch_in }.to raise_error 'balance too low!'
    end
  end

  describe '#Will deduct fare amount on touch_out' do
    before { subject.top_up(10) }
    min = Oystercard::MIN_FARE
    it "will deduct MIN_FARE of £#{min} upon touch_out" do
      subject.touch_in
      expect { subject.touch_out }.to change { subject.balance }.by(-min)
    end
  end

  describe '#will check that start_station is a result from stations instance' do
    before do
      allow_any_instance_of(Stations).to receive(:current_station) { "Westminster" }
      subject.top_up(20)
      subject.touch_in
    end
    it 'captures start station' do
      expect(subject.start_station).to eq "Westminster"
    end
  end


end
