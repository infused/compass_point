require 'spec_helper'

describe CompassPoint do
  describe '.azimuth' do
    it 'returns mid point in degrees' do
      expect(CompassPoint.azimuth('N')).to eq 0.0
      expect(CompassPoint.azimuth(:nw)).to eq 315.0
      expect(CompassPoint.azimuth('sbw')).to eq 191.25
      expect(CompassPoint.azimuth('X')).to be_nil
    end
  end

  describe '.min' do
    it 'returns min point in degrees' do
      expect(CompassPoint.min('N')).to eq 354.38
      expect(CompassPoint.min(:nw)).to eq 309.38
      expect(CompassPoint.min('sbw')).to eq 185.63
      expect(CompassPoint.min('X')).to be_nil
    end
  end

  describe '.max' do
    it 'returns max point in degrees' do
      expect(CompassPoint.max('N')).to eq 5.62
      expect(CompassPoint.max(:nw)).to eq 320.62
      expect(CompassPoint.max('sbw')).to eq 196.87
      expect(CompassPoint.max('X')).to be_nil
    end
  end

  describe '.min_max' do
    it 'returns [min, max]' do
      expect(CompassPoint.min_max('N')).to eq [354.38, 5.62]
      expect(CompassPoint.min_max(:nw)).to eq [309.38, 320.62]
      expect(CompassPoint.min_max('sbw')).to eq [185.63, 196.87]
      expect(CompassPoint.min_max('X')).to be_nil
    end
  end

  describe '.name' do
    it 'returns the points full name' do
      expect(CompassPoint.name('nnw')).to eq 'North northwest'
    end
  end

end
