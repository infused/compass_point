# Compass Point
[![Version](http://img.shields.io/gem/v/compass_point.svg?style=flat)](https://rubygems.org/gems/compass_point)
[![Build Status](http://img.shields.io/travis/infused/compass_point/master.svg?style=flat)](http://travis-ci.org/infused/compass_point)
[![Total Downloads](https://img.shields.io/gem/dt/compass_point.svg)](https://rubygems.org/gems/compass_point/)
[![License](https://img.shields.io/github/license/infused/compass_point.svg)](https://github.com/infused/compass_point)

A Ruby library for working with compass points.

![Compass Rose](https://upload.wikimedia.org/wikipedia/commons/thumb/f/f8/Compass_Rose_English_North.svg/237px-Compass_Rose_English_North.svg.png)

* Project page: <http://github.com/infused/compass_point>
* API Documentation: <http://rubydoc.info/github/infused/compass_point/>
* Report bugs: <http://github.com/infused/compass_point/issues>

## Compatibility

Compass Point is tested to work with the following versions of ruby:

* MRI Ruby 2.0.x, 2.1.x, 2.2.x, 2.3.x, 2.4.x, 2.5.x
* JRuby 1.7.x

## Installation

    gem install compass_point

## Basic Usage

### Azimuth

Given an string such as "NW", "SE", "Northeast by east", or "N 20° W", `azimuth` will
return the corresponding azimuth in degrees from 0 to 360:

    CompassPoint.azimuth('N') #=> 0.0
    CompassPoint.azimuth('S') #=> 180.0
    CompassPoint.azimuth('swbs') #=> 213.75
    CompassPoint.azimuth('Northeast by east') #=> 56.25
    CompassPoint.azimuth('N 20° W') #=> 340

You can also get the minimum and maximum azimuths for any
abbreviation with `min`, `max` and `min_max`:

    CompassPoint.min('E') #=> 84.38
    CompassPoint.max('E') #=> 95.62
    CompassPoint.min('Northeast by east') #=> 50.63
    CompassPoint.max('Northeast by east') #=> 61.87
    CompassPoint.min_max('E') #=> [84.38, 95.62]
    CompassPoint.min_max('Northeast by east') #=> [50.63, 61.87]

Get the full name for an abbreviation:

    CompassPoint.name('NNW') #=> "North northwest"
    CompassPoint.name('SEbS') #=> "Southeast by south"


### Compass Quadrant Bearing

Given an azimuth, calculate the compass quadrant bearing.  For
example:

    CompassPoint.compass_quadrant_bearing(103) #=> "S 77° E"
    CompassPoint.compass_quadrant_bearing(340) #=> "N 20° W"
    CompassPoint.compass_quadrant_bearing(0) #=> "N"

## License

Copyright (c) 2015-2018 Keith Morrison <<keithm@infused.org>>

Permission is hereby granted, free of charge, to any person
obtaining a copy of this software and associated documentation
files (the "Software"), to deal in the Software without
restriction, including without limitation the rights to use,
copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the
Software is furnished to do so, subject to the following
conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
OTHER DEALINGS IN THE SOFTWARE.
