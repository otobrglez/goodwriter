$:.unshift(File.join(File.dirname(__FILE__), "lib"))
require 'good_writer'

EM.run do
  Bots::PingPong.new.run
  Bots::PingPong.new.run
end