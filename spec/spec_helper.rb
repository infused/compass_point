begin
  require 'codeclimate-test-reporter'
  CodeClimate::TestReporter.start
rescue LoadError
end

require 'compass_point'
require 'rspec'

RSpec.configure do |config|

end
