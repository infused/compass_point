class CompassPoint
  VERSION = '1.0.0'

  POINTS = {
    n:    {min: 354.38, mid: 0.0,    max: 5.62},
    nbe:  {min: 5.63,   mid: 11.25,  max: 16.87},
    nne:  {min: 16.88,  mid: 22.5,   max: 28.12},
    nebn: {min: 28.13,  mid: 33.75,  max: 39.37},
    ne:   {min: 39.38,  mid: 45.0,   max: 50.62},
    nebe: {min: 50.63,  mid: 56.25,  max: 61.87},
    ene:  {min: 61.88,  mid: 67.5,   max: 73.12},
    ebn:  {min: 73.13,  mid: 78.75,  max: 84.37},
    e:    {min: 84.38,  mid: 90.0,   max: 95.62},
    ebs:  {min: 95.63,  mid: 101.25, max: 106.87},
    ese:  {min: 106.88, mid: 112.5,  max: 118.12},
    sebe: {min: 118.13, mid: 123.75, max: 129.37},
    se:   {min: 129.38, mid: 135.0,  max: 140.62},
    sebs: {min: 140.63, mid: 146.25, max: 151.87},
    sse:  {min: 151.88, mid: 157.5,  max: 163.12},
    sbe:  {min: 163.13, mid: 168.75, max: 174.37},
    s:    {min: 174.38, mid: 180.0,  max: 185.62},
    sbw:  {min: 185.63, mid: 191.25, max: 196.87},
    ssw:  {min: 196.88, mid: 202.5,  max: 208.12},
    swbs: {min: 208.13, mid: 213.75, max: 219.37},
    sw:   {min: 219.38, mid: 225.0,  max: 230.62},
    swbw: {min: 230.63, mid: 236.25, max: 241.87},
    wsw:  {min: 241.88, mid: 247.5,  max: 253.12},
    wbs:  {min: 253.13, mid: 258.75, max: 264.37},
    w:    {min: 264.38, mid: 270.0,  max: 275.62},
    wbn:  {min: 275.63, mid: 281.25, max: 286.87},
    wnw:  {min: 286.88, mid: 292.5,  max: 298.12},
    nwbw: {min: 298.13, mid: 303.75, max: 309.37},
    nw:   {min: 309.38, mid: 315.0,  max: 320.62},
    nwbn: {min: 320.63, mid: 326.25, max: 331.87},
    nnw:  {min: 331.88, mid: 337.50, max: 343.12},
    nbw:  {min: 343.13, mid: 348.75, max: 354.37}
  }

  class << self
    def azimuth(compass_point)
      key = normalize_key(compass_point)
      point = POINTS[key]
      point && point[:mid]
    end

    private

    def normalize_key(compass_point)
      compass_point.to_s.downcase.to_sym
    end
  end



end
