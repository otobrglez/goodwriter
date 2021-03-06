require "yaml"
require "erb"
require "redis"
require "hiredis"
require "em-synchrony"
# require "em-redis"
require "em-hiredis"

module GoodWriter::Utils
  def self.config
    @@config ||= YAML.load(ERB.new(File.read("config.yml")).result)[ENV["GOOD_WRITER_ENV"]]
  end

  def self.redis
    @@redis ||= Redis.new(
      :url => config["redis_url"],
      :db=> (config["redis_db"] rescue 0)
    )
  end

  def self.aredis
    @@aredis ||= EM::Hiredis.connect config["redis_url"]
  end

  def self.aredisp # for push
    @@aredisp ||= EM::Hiredis.connect config["redis_url"]
  end

  def config; GoodWriter::Utils.config end
  def redis; GoodWriter::Utils.redis end
  def aredis; GoodWriter::Utils.aredis end
  def aredisp; GoodWriter::Utils.aredisp end
end
