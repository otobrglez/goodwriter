module GoodWriter::Bot
  include GoodWriter::Utils

  def self.included who
    who.extend ClassMethods
  end

  module ClassMethods
    def listen_to q_name, method
      include GoodWriter::Bot::InstanceMethods

      ClassMethods.instance_variable_set :@q_name, q_name
      ClassMethods.instance_variable_set :@listen_method, method
    end
  end

  module InstanceMethods
    def run
      EM.run do
        aredis.callback {
          throw "#Connection failed." unless aredis.connected?
        }

        aredis.subscribe "life"
        aredis.subscribe ClassMethods.instance_variable_get(:@q_name)
        aredis.on(:message) do |c,m|
          EM.stop if c == "life" and m == "kill"

          if c == ClassMethods.instance_variable_get(:@q_name)
            self.send ClassMethods.instance_variable_get(:@listen_method), m
          end
        end
      end

    end

  end

end
