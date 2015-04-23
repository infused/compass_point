require 'spec_helper'

describe CompassPoint do
  describe '.azimuth' do

    it 'returns mid point' do
      expect(CompassPoint.azimuth('N')).to eq 0.0
      expect(CompassPoint.azimuth(:nw)).to eq 315.0
      expect(CompassPoint.azimuth('sbw')).to eq 191.25
      expect(CompassPoint.azimuth('X')).to be_nil
    end
  end

end
