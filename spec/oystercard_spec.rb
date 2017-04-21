require 'oystercard'

describe Oystercard do

  describe '#in_journey state changes' do
    before do
      subject.balance.top_up(10)
      subject.touch_in
    end

    it 'will change journey instance to create journey start hash' do
      expect(subject.journey_instance.journey_start("test")[:Status]).to eq :started
    end

    it 'will change journey instance to create journey_end hash' do
      subject.touch_out
      expect(subject.journey_instance.last_journey[:Status]).to eq :finished
    end
  end

  describe '#Will deduct fare amount on touch_out' do
    before { subject.balance.top_up(10) }
    it "will deduct MIN_FARE of £#{Balance::MIN_FARE} upon touch_out" do
      subject.touch_in
      expect { subject.touch_out }.to change { subject.balance.value }.by(-(Balance::MIN_FARE))
    end
  end

  describe '#will check that start_station is a result from stations instance' do
    before do
      subject.balance.top_up(20)
      subject.touch_in
    end
    it 'captures start station' do
      expect(subject.stations_instance.stations).to include subject.start_station
    end
  end


end
