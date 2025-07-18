require 'spec_helper'

describe CompassPoint do
  describe '.azimuth' do
    it 'returns mid point in degrees' do
      expect(described_class.azimuth('N')).to eq 0.0
      expect(described_class.azimuth(:nw)).to eq 315.0
      expect(described_class.azimuth('sbw')).to eq 191.25
      expect(described_class.azimuth('X')).to be_nil
      expect(described_class.azimuth('Northeast by east')).to eq 56.25
      expect(described_class.azimuth('N 27° E')).to eq 27
      expect(described_class.azimuth('S 77° E')).to eq 103
      expect(described_class.azimuth('S 2° E')).to eq 178
      expect(described_class.azimuth('N 77° W')).to eq 283
      expect(described_class.azimuth('N 20 W')).to eq 340
      expect(described_class.azimuth('S 30° W')).to eq 210
    end

    it 'returns nil for nil input' do
      expect(described_class.azimuth(nil)).to be_nil
    end

    it 'returns nil for empty string' do
      expect(described_class.azimuth('')).to be_nil
    end

    it 'returns nil for whitespace-only string' do
      expect(described_class.azimuth('   ')).to be_nil
    end

    it 'returns nil for numeric input' do
      expect(described_class.azimuth(123)).to be_nil
    end

    it 'returns nil for array input' do
      expect(described_class.azimuth([])).to be_nil
    end

    it 'returns nil for hash input' do
      expect(described_class.azimuth({})).to be_nil
    end

    it 'handles case insensitive input' do
      expect(described_class.azimuth('N')).to eq described_class.azimuth('n')
      expect(described_class.azimuth('NW')).to eq described_class.azimuth('nw')
      expect(described_class.azimuth('Northeast by East')).to eq described_class.azimuth('northeast by east')
    end

    it 'handles extra whitespace in input' do
      expect(described_class.azimuth('  N  ')).to eq 0.0
      expect(described_class.azimuth('Northeast   by   east')).to eq 56.25
      expect(described_class.azimuth('N  27°  E')).to eq 27
    end

    it 'handles compass bearing without degree symbol' do
      expect(described_class.azimuth('N 27 E')).to eq 27
      expect(described_class.azimuth('S 77 E')).to eq 103
      expect(described_class.azimuth('N 77 W')).to eq 283
    end

    it 'handles three-digit compass bearings' do
      expect(described_class.azimuth('N 180 E')).to be_nil
      expect(described_class.azimuth('N 90 E')).to eq 90
      expect(described_class.azimuth('S 90 W')).to eq 270
    end

    it 'handles mixed case compass bearings' do
      expect(described_class.azimuth('n 27° e')).to eq 27
      expect(described_class.azimuth('S 77° e')).to eq 103
      expect(described_class.azimuth('N 77° w')).to eq 283
    end

    it 'returns nil for invalid compass bearings' do
      expect(described_class.azimuth('N 91 E')).to be_nil
      expect(described_class.azimuth('N -1 E')).to be_nil
      expect(described_class.azimuth('X 45 Y')).to be_nil
      expect(described_class.azimuth('N E')).to be_nil
      expect(described_class.azimuth('45 N E')).to be_nil
    end

    it 'handles boundary degree values' do
      expect(described_class.azimuth('N 0 E')).to eq 0
      expect(described_class.azimuth('N 90 E')).to eq 90
      expect(described_class.azimuth('S 90 E')).to eq 90
      expect(described_class.azimuth('S 90 W')).to eq 270
    end
  end

  describe '.back_azimuth' do
    it 'returns opposite of azimuth' do
      expect(described_class.back_azimuth('N')).to eq 180.0
      expect(described_class.back_azimuth(:nw)).to eq 135.0
      expect(described_class.back_azimuth('sbw')).to eq 11.25
      expect(described_class.back_azimuth('X')).to be_nil
      expect(described_class.back_azimuth('Northeast by east')).to eq 236.25
      expect(described_class.back_azimuth('N 27° E')).to eq 207
      expect(described_class.back_azimuth('S 77° E')).to eq 283
      expect(described_class.back_azimuth('S 2° E')).to eq 358
      expect(described_class.back_azimuth('N 77° W')).to eq 103
      expect(described_class.back_azimuth('N 20 W')).to eq 160
      expect(described_class.back_azimuth('S 30° W')).to eq 30
    end

    it 'returns nil for nil input' do
      expect(described_class.back_azimuth(nil)).to be_nil
    end

    it 'returns nil for empty string' do
      expect(described_class.back_azimuth('')).to be_nil
    end

    it 'returns nil for whitespace-only string' do
      expect(described_class.back_azimuth('   ')).to be_nil
    end

    it 'returns nil for numeric input' do
      expect(described_class.back_azimuth(123)).to be_nil
    end
  end

  describe '.min' do
    it 'returns min point in degrees' do
      expect(described_class.min('N')).to eq 354.38
      expect(described_class.min(:nw)).to eq 309.38
      expect(described_class.min('sbw')).to eq 185.63
      expect(described_class.min('X')).to be_nil
      expect(described_class.min('Northeast by east')).to eq 50.63
    end

    it 'returns nil for nil input' do
      expect(described_class.min(nil)).to be_nil
    end

    it 'returns nil for empty string' do
      expect(described_class.min('')).to be_nil
    end

    it 'returns nil for whitespace-only string' do
      expect(described_class.min('   ')).to be_nil
    end

    it 'returns nil for numeric input' do
      expect(described_class.min(123)).to be_nil
    end
  end

  describe '.max' do
    it 'returns max point in degrees' do
      expect(described_class.max('N')).to eq 5.62
      expect(described_class.max(:nw)).to eq 320.62
      expect(described_class.max('sbw')).to eq 196.87
      expect(described_class.max('X')).to be_nil
      expect(described_class.max('Northeast by east')).to eq 61.87
    end

    it 'returns nil for nil input' do
      expect(described_class.max(nil)).to be_nil
    end

    it 'returns nil for empty string' do
      expect(described_class.max('')).to be_nil
    end

    it 'returns nil for whitespace-only string' do
      expect(described_class.max('   ')).to be_nil
    end

    it 'returns nil for numeric input' do
      expect(described_class.max(123)).to be_nil
    end
  end

  describe '.min_max' do
    it 'returns [min, max]' do
      expect(described_class.min_max('N')).to eq [354.38, 5.62]
      expect(described_class.min_max(:nw)).to eq [309.38, 320.62]
      expect(described_class.min_max('sbw')).to eq [185.63, 196.87]
      expect(described_class.min_max('X')).to be_nil
      expect(described_class.min_max('Northeast by east')).to eq [50.63, 61.87]
    end

    it 'returns nil for nil input' do
      expect(described_class.min_max(nil)).to be_nil
    end

    it 'returns nil for empty string' do
      expect(described_class.min_max('')).to be_nil
    end

    it 'returns nil for whitespace-only string' do
      expect(described_class.min_max('   ')).to be_nil
    end

    it 'returns nil for numeric input' do
      expect(described_class.min_max(123)).to be_nil
    end
  end

  describe '.name' do
    it 'returns the points full name' do
      expect(described_class.name('nnw')).to eq 'North northwest'
    end

    it 'returns nil for nil input' do
      expect(described_class.name(nil)).to be_nil
    end

    it 'returns nil for empty string' do
      expect(described_class.name('')).to be_nil
    end

    it 'returns nil for whitespace-only string' do
      expect(described_class.name('   ')).to be_nil
    end

    it 'returns nil for numeric input' do
      expect(described_class.name(123)).to be_nil
    end

    it 'returns nil for invalid compass point' do
      expect(described_class.name('invalid')).to be_nil
    end
  end

  describe '.compass_quadrant_bearing' do
    it 'converts bearing to compass quadrant format' do
      expect(described_class.compass_quadrant_bearing(0)).to eq 'N'
      expect(described_class.compass_quadrant_bearing(27)).to eq 'N 27° E'
      expect(described_class.compass_quadrant_bearing(27.4)).to eq 'N 27° E'
      expect(described_class.compass_quadrant_bearing(27.7)).to eq 'N 28° E'
      expect(described_class.compass_quadrant_bearing(90)).to eq 'E'
      expect(described_class.compass_quadrant_bearing(103)).to eq 'S 77° E'
      expect(described_class.compass_quadrant_bearing(178)).to eq 'S 2° E'
      expect(described_class.compass_quadrant_bearing(180)).to eq 'S'
      expect(described_class.compass_quadrant_bearing(210)).to eq 'S 30° W'
      expect(described_class.compass_quadrant_bearing(270)).to eq 'W'
      expect(described_class.compass_quadrant_bearing(283)).to eq 'N 77° W'
      expect(described_class.compass_quadrant_bearing(340)).to eq 'N 20° W'
      expect(described_class.compass_quadrant_bearing(360)).to eq 'N'
    end

    it 'returns nil for nil input' do
      expect(described_class.compass_quadrant_bearing(nil)).to be_nil
    end

    it 'returns nil for string input' do
      expect(described_class.compass_quadrant_bearing('123')).to be_nil
    end

    it 'returns nil for array input' do
      expect(described_class.compass_quadrant_bearing([])).to be_nil
    end

    it 'returns nil for hash input' do
      expect(described_class.compass_quadrant_bearing({})).to be_nil
    end

    it 'returns nil for negative bearing' do
      expect(described_class.compass_quadrant_bearing(-1)).to be_nil
    end

    it 'returns nil for bearing over 360' do
      expect(described_class.compass_quadrant_bearing(361)).to be_nil
    end

    it 'returns nil for large negative bearing' do
      expect(described_class.compass_quadrant_bearing(-90)).to be_nil
    end

    it 'returns nil for large positive bearing' do
      expect(described_class.compass_quadrant_bearing(450)).to be_nil
    end

    it 'handles edge case at 360 degrees' do
      expect(described_class.compass_quadrant_bearing(360)).to eq 'N'
      expect(described_class.compass_quadrant_bearing(360.0)).to eq 'N'
    end

    it 'handles floating point precision near boundaries' do
      expect(described_class.compass_quadrant_bearing(0.4)).to eq 'N'
      expect(described_class.compass_quadrant_bearing(0.5)).to eq 'N 1° E'
      expect(described_class.compass_quadrant_bearing(89.4)).to eq 'N 89° E'
      expect(described_class.compass_quadrant_bearing(89.5)).to eq 'E'
      expect(described_class.compass_quadrant_bearing(90.4)).to eq 'E'
      expect(described_class.compass_quadrant_bearing(90.5)).to eq 'S 89° E'
    end

    it 'handles exact quadrant boundaries' do
      expect(described_class.compass_quadrant_bearing(0.0)).to eq 'N'
      expect(described_class.compass_quadrant_bearing(90.0)).to eq 'E'
      expect(described_class.compass_quadrant_bearing(180.0)).to eq 'S'
      expect(described_class.compass_quadrant_bearing(270.0)).to eq 'W'
    end

    it 'handles Float::INFINITY and Float::NAN' do
      expect(described_class.compass_quadrant_bearing(Float::INFINITY)).to be_nil
      expect(described_class.compass_quadrant_bearing(-Float::INFINITY)).to be_nil
      expect(described_class.compass_quadrant_bearing(Float::NAN)).to be_nil
    end
  end
end
