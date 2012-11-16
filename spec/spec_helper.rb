$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))

ENV["GOOD_WRITER_ENV"] ||= 'test'

require 'spork'
require 'good_writer'

#uncomment the following line to use spork with the debugger
#require 'spork/ext/ruby-debug'

Spork.prefork do
  require 'rspec/autorun'

  RSpec.configure do |c|
  end
end

Spork.each_run do

end
