require "bundler/setup"

ENV["GOOD_WRITER_ENV"] ||= 'development'

module GoodWriter; end

require 'good_writer/utils'
require 'good_writer/submiter'
require 'good_writer/bot'



