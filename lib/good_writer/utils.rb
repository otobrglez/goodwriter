require "yaml"
require "erb"
require "redis"

module GoodWriter::Utils
  def self.config
    @@config ||= YAML.load(ERB.new(File.read("config.yml")).result)[ENV["GOOD_WRITER_ENV"]]
  end

  def self.redis
    unless defined? @@redis
      uri = URI.parse(config["redis_url"])
    end

    @@redis ||= Redis.new(
      :url => config["redis_url"],
      :db=> (config["redis_db"] rescue 0)
    )
  end

  def config; GoodWriter::Utils.config end
  def redis; GoodWriter::Utils.redis end
end
