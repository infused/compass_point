class CompassPoint
  VERSION = '1.2.1'.freeze

  COMPASS_BEARING_REGEX = /(n|s)\s(\d{1,3}).?\s(e|w)/.freeze

  POINTS = {
    n: {min: 354.38, mid: 0.0, max: 5.62, name: 'North'},
    nbe: {min: 5.63,   mid: 11.25,  max: 16.87,  name: 'North by east'},
    nne: {min: 16.88,  mid: 22.5,   max: 28.12,  name: 'North-northeast'},
    nebn: {min: 28.13, mid: 33.75, max: 39.37, name: 'Northeast by north'},
    ne: {min: 39.38, mid: 45.0, max: 50.62, name: 'Northeast'},
    nebe: {min: 50.63, mid: 56.25, max: 61.87, name: 'Northeast by east'},
    ene: {min: 61.88,  mid: 67.5,   max: 73.12,  name: 'East-northeast'},
    ebn: {min: 73.13,  mid: 78.75,  max: 84.37,  name: 'East by north'},
    e: {min: 84.38, mid: 90.0, max: 95.62, name: 'East'},
    ebs: {min: 95.63,  mid: 101.25, max: 106.87, name: 'East by south'},
    ese: {min: 106.88, mid: 112.5,  max: 118.12, name: 'East-southeast'},
    sebe: {min: 118.13, mid: 123.75, max: 129.37, name: 'Southeast by east'},
    se: {min: 129.38, mid: 135.0, max: 140.62, name: 'Southeast'},
    sebs: {min: 140.63, mid: 146.25, max: 151.87, name: 'Southeast by south'},
    sse: {min: 151.88, mid: 157.5,  max: 163.12, name: 'South-southeast'},
    sbe: {min: 163.13, mid: 168.75, max: 174.37, name: 'South by east'},
    s: {min: 174.38, mid: 180.0, max: 185.62, name: 'South'},
    sbw: {min: 185.63, mid: 191.25, max: 196.87, name: 'South by west'},
    ssw: {min: 196.88, mid: 202.5,  max: 208.12, name: 'South southwest'},
    swbs: {min: 208.13, mid: 213.75, max: 219.37, name: 'Southwest by south'},
    sw: {min: 219.38, mid: 225.0, max: 230.62, name: 'Southwest'},
    swbw: {min: 230.63, mid: 236.25, max: 241.87, name: 'Southwest by west'},
    wsw: {min: 241.88, mid: 247.5,  max: 253.12, name: 'West-southwest'},
    wbs: {min: 253.13, mid: 258.75, max: 264.37, name: 'West by south'},
    w: {min: 264.38, mid: 270.0, max: 275.62, name: 'West'},
    wbn: {min: 275.63, mid: 281.25, max: 286.87, name: 'West by north'},
    wnw: {min: 286.88, mid: 292.5,  max: 298.12, name: 'West-northwest'},
    nwbw: {min: 298.13, mid: 303.75, max: 309.37, name: 'Northwest by west'},
    nw: {min: 309.38, mid: 315.0, max: 320.62, name: 'Northwest'},
    nwbn: {min: 320.63, mid: 326.25, max: 331.87, name: 'Northwest by north'},
    nnw: {min: 331.88, mid: 337.50, max: 343.12, name: 'North northwest'},
    nbw: {min: 343.13, mid: 348.75, max: 354.37, name: 'North by west'}
  }.freeze

  class << self
    def azimuth(s)
      input = normalize_input(s)
      if point = find_point(input)
        point[:mid]
      elsif match = input.match(COMPASS_BEARING_REGEX)
        azimuth_from_match(match)
      end
    end

    def back_azimuth(s)
      azm = azimuth(s)
      return if azm.nil?

      azm > 180 ? azm - 180 : azm + 180
    end

    def min(s)
      point = find_point(normalize_input(s))
      point && point[:min]
    end

    def max(s)
      point = find_point(normalize_input(s))
      point && point[:max]
    end

    def min_max(s)
      point = find_point(normalize_input(s))
      point && [point[:min], point[:max]]
    end

    def name(s)
      point = find_point(normalize_input(s))
      point && point[:name]
    end

    def compass_quadrant_bearing(bearing)
      b = bearing.round
      case b
      when 0, 360 then 'N'
      when 90     then 'E'
      when 180    then 'S'
      when 270    then 'W'
      else
        generate_compass_quadrant_bearing(b)
      end
    end

    private

    def azimuth_from_match(match)
      base = if match[1] == 'n'
        match[3] == 'w' ? 360 : 0
      else
        180
      end

      adjust = match[2].to_i

      operation = if (match[1] == 'n' && match[3] == 'w') || (match[1] == 's' && match[3] == 'e')
        :-
      else
        :+
      end

      base.send(operation, adjust)
    end

    def generate_compass_quadrant_bearing(b)
      s = []
      s << north_or_south(b)
      s << if north_or_south(b) == 'N'
        east_or_west(b) == 'W' ? (360 - b).abs : b
      else
        (180 - b).abs
      end.to_s
      s.last << '°'
      s << east_or_west(b)
      s.join(' ')
    end

    def north_or_south(bearing)
      b = bearing.round
      (0..90).cover?(b.to_i) || (270..360).cover?(b.to_i) ? 'N' : 'S'
    end

    def east_or_west(bearing)
      b = bearing.round
      (180..360).cover?(b.to_i) ? 'W' : 'E'
    end

    def find_point(s)
      find_point_by_abbrev(s) || find_point_by_name(s)
    end

    def find_point_by_abbrev(s)
      POINTS[s.to_sym]
    end

    def find_point_by_name(s)
      POINTS.values.find { |v| v[:name].downcase == s }
    end

    def normalize_input(name)
      name.to_s.strip.squeeze(' ').downcase
    end

    def radians_to_degrees(radians)
      radians * 180 / Math::PI
    end

    def degrees_to_radians(degrees)
      degrees * Math::PI / 180
    end
  end
end
