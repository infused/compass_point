require 'spec_helper'

describe CompassPoint do
  describe '.azimuth' do
    it 'returns mid point in degrees' do
      expect(CompassPoint.azimuth('N')).to eq 0.0
      expect(CompassPoint.azimuth(:nw)).to eq 315.0
      expect(CompassPoint.azimuth('sbw')).to eq 191.25
      expect(CompassPoint.azimuth('X')).to be_nil
      expect(CompassPoint.azimuth('Northeast by east')).to eq 56.25
      expect(CompassPoint.azimuth('N 27° E')).to eq 27
      expect(CompassPoint.azimuth('S 77° E')).to eq 103
      expect(CompassPoint.azimuth('S 2° E')).to eq 178
      expect(CompassPoint.azimuth('N 77° W')).to eq 283
      expect(CompassPoint.azimuth('N 20 W')).to eq 340
      expect(CompassPoint.azimuth('S 30° W')).to eq 210
    end
  end

  describe '.back_azimuth' do
    it 'returns opposite of azimuth' do
      expect(CompassPoint.back_azimuth('N')).to eq 180.0
      expect(CompassPoint.back_azimuth(:nw)).to eq 135.0
      expect(CompassPoint.back_azimuth('sbw')).to eq 11.25
      expect(CompassPoint.back_azimuth('X')).to be_nil
      expect(CompassPoint.back_azimuth('Northeast by east')).to eq 236.25
      expect(CompassPoint.back_azimuth('N 27° E')).to eq 207
      expect(CompassPoint.back_azimuth('S 77° E')).to eq 283
      expect(CompassPoint.back_azimuth('S 2° E')).to eq 358
      expect(CompassPoint.back_azimuth('N 77° W')).to eq 103
      expect(CompassPoint.back_azimuth('N 20 W')).to eq 160
      expect(CompassPoint.back_azimuth('S 30° W')).to eq 30
    end
  end

  describe '.min' do
    it 'returns min point in degrees' do
      expect(CompassPoint.min('N')).to eq 354.38
      expect(CompassPoint.min(:nw)).to eq 309.38
      expect(CompassPoint.min('sbw')).to eq 185.63
      expect(CompassPoint.min('X')).to be_nil
      expect(CompassPoint.min('Northeast by east')).to eq 50.63
    end
  end

  describe '.max' do
    it 'returns max point in degrees' do
      expect(CompassPoint.max('N')).to eq 5.62
      expect(CompassPoint.max(:nw)).to eq 320.62
      expect(CompassPoint.max('sbw')).to eq 196.87
      expect(CompassPoint.max('X')).to be_nil
      expect(CompassPoint.max('Northeast by east')).to eq 61.87
    end
  end

  describe '.min_max' do
    it 'returns [min, max]' do
      expect(CompassPoint.min_max('N')).to eq [354.38, 5.62]
      expect(CompassPoint.min_max(:nw)).to eq [309.38, 320.62]
      expect(CompassPoint.min_max('sbw')).to eq [185.63, 196.87]
      expect(CompassPoint.min_max('X')).to be_nil
      expect(CompassPoint.min_max('Northeast by east')).to eq [50.63, 61.87]
    end
  end

  describe '.name' do
    it 'returns the points full name' do
      expect(CompassPoint.name('nnw')).to eq 'North northwest'
    end
  end

  describe '.compass_quadrant_bearing' do
    it 'is' do
      expect(CompassPoint.compass_quadrant_bearing(0)).to eq 'N'
      expect(CompassPoint.compass_quadrant_bearing(27)).to eq 'N 27° E'
      expect(CompassPoint.compass_quadrant_bearing(27.4)).to eq 'N 27° E'
      expect(CompassPoint.compass_quadrant_bearing(27.7)).to eq 'N 28° E'
      expect(CompassPoint.compass_quadrant_bearing(90)).to eq 'E'
      expect(CompassPoint.compass_quadrant_bearing(103)).to eq 'S 77° E'
      expect(CompassPoint.compass_quadrant_bearing(178)).to eq 'S 2° E'
      expect(CompassPoint.compass_quadrant_bearing(180)).to eq 'S'
      expect(CompassPoint.compass_quadrant_bearing(210)).to eq 'S 30° W'
      expect(CompassPoint.compass_quadrant_bearing(270)).to eq 'W'
      expect(CompassPoint.compass_quadrant_bearing(283)).to eq 'N 77° W'
      expect(CompassPoint.compass_quadrant_bearing(340)).to eq 'N 20° W'
      expect(CompassPoint.compass_quadrant_bearing(360)).to eq 'N'
    end
  end

end
