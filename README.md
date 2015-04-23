# Compass Point
[![Version](http://img.shields.io/gem/v/compass_point.svg?style=flat)](https://rubygems.org/gems/compass_point)
[![Build Status](http://img.shields.io/travis/infused/compass_point/master.svg?style=flat)](http://travis-ci.org/infused/compass_point)
[![Code Quality](http://img.shields.io/codeclimate/github/infused/compass_point.svg?style=flat)](https://codeclimate.com/github/infused/compass_point)
[![Test Coverage](http://img.shields.io/codeclimate/coverage/github/infused/compass_point.svg?style=flat)](https://codeclimate.com/github/infused/compass_point)
[![Dependency Status](http://img.shields.io/gemnasium/infused/compass_point.svg?style=flat)](https://gemnasium.com/infused/compass_point)

A Ruby library for working with compass points

* Project page: <http://github.com/infused/compass_point>
* API Documentation: <http://rubydoc.info/github/infused/compass_point/>
* Report bugs: <http://github.com/infused/compass_point/issues>

## Compatibility

Compass Point is tested to work with the following versions of ruby:

* MRI Ruby 1.9.3, 2.0.x, 2.1.x, 2.2.x
* JRuby 1.7.x
* Rubinius 2.1+

## Installation

    gem install compass_point

## Basic Usage

Given an abbreviation such as "NW" or "SE", `azimuth` will
return the corresponding azimuth in degrees from 0 to 360:

    require 'compass_point'

    CompassPoint.azimuth('N') #=> 0.0
    CompassPoint.azimuth('S') #=> 180.0
    CompassPoint.azimuth('swbs') #=> 213.75


You can also get the minimum and maximum azimuths for any
abbreviation with `min`, `max` and `min_max`:

    CompassPoint.min('E') #=> 84.38
    CompassPoint.max('E') #=> 95.62
    CompassPoint.min_max('E') #=> [84.38, 95.62]


## License

Copyright (c) 2015 Keith Morrison <<keithm@infused.org>>

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