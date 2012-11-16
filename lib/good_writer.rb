require "bundler/setup"

ENV["GOOD_WRITER_ENV"] ||= 'development'

require 'good_writer/utils'
require 'good_writer/submiter'
require 'good_writer/bot'

module GoodWriter; end

