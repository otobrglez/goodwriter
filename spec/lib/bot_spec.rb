require "spec_helper"

describe GoodWriter::Bot do
  subject do
    class EchoBot
      attr_accessor :test_msg
      include GoodWriter::Bot
      listen_to "sayhi", :sayhi

      def sayhi msg
        @test_msg = "sayhi: #{msg}"
      end
    end
    EchoBot.new
  end

  it "subscribe with publish" do
    EM.run do
      subject.run
      subject.aredisp.publish("sayhi","test x").callback{ |v,m|
        v.should == 1
        subject.test_msg.should =~ /test\ x/

        EM.stop
      }.errback { |e| puts e }
    end
  end
end