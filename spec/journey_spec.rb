require './lib/journey.rb'

describe Journey do
  before { subject.journey_start("Westminster") }
  describe 'Will build compltete journey' do
     it 'will receive start station into a hash including time stamp' do
       expect(subject.journey_array[0][:Station]).to include "Westminster"
     end

     it 'will receive end station into a hash including time stamp' do
       subject.journey_end("Aldgate East")
       expect(subject.journey_array[1][:Station]).to include "Aldgate East"
     end
   end
end
