require 'stations'

describe Stations do
  it 'will included STATION constant that includes and existing array' do
    expect(subject.instance_variable_get(:@stations)).to_not eq nil
  end

  it 'will return string upon requesting current station' do
    expect(subject.instance_variable_get(:@stations)).to include subject.current_station
  end

  it 'will have a zone assocaited with each station' do
    expect(subject.current_station).to include :zone
  end
end
