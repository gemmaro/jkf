ENV['SKIP_SIMPLECOV'] or
  begin
    require 'simplecov'
    SimpleCov.start
  end

require 'kconv'
require "debug"

$LOAD_PATH.unshift File.expand_path('../lib', __dir__)
require 'jkf'

module ExtendHelper
  def fixtures(type)
    Dir[File.join(__dir__, "fixtures/#{type}/**/*.*")]
  end

  def error_fixtures(type)
    Dir[File.join(__dir__, "../error_fixtures/#{type}/**/*.*")]
  end
end

module IncludeHelper
  def pos(x, y)
    { 'x' => x, 'y' => y }
  end

  def hms(h, m, s)
    { 'h' => h, 'm' => m, 's' => s }
  end

  def ms(m, s)
    { 'm' => m, 's' => s }
  end

  include ExtendHelper
end

RSpec.configure do |config|
  config.extend ExtendHelper
  config.include IncludeHelper
end
