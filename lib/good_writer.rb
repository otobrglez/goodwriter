require "bundler/setup"
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..'))

ENV["GOOD_WRITER_ENV"] ||= 'development'

module GoodWriter; end

require 'good_writer/utils'
require 'good_writer/submiter'
require 'good_writer/bot'

module Bots; end

require 'bots/ping_pong'