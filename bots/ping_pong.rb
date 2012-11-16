class Bots::PingPong
  include GoodWriter::Bot

  listen_to "ping", :handle_ping

  def handle_ping msg
    puts "pong at #{DateTime.now}"
  end
end
