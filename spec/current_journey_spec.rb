require './lib/current_journey.rb'


describe Current_journey do
  before { subject.journey_start("Westminster") }
  describe 'Will build compltete journey' do
     it 'will receive start station into a hash including time stamp' do
       expect(subject.journey_start("Westminster")[:Start_Station]).to include "Westminster"
     end

     it 'will receive end station into a hash including time stamp' do
       subject.journey_end("Aldgate East")
       expect(subject.last_journey[:Finish_Station]).to include "Aldgate East"
     end
  end

  before do
    subject.journey_start("Algate East")
  end
  describe 'Will check if existing instance of :start/:finished exists' do
    it 'will create new instance of Invalid Journey if journey started' do
      expect(subject.journey_start("Algate East")).to raise_error
    end
  end
end
