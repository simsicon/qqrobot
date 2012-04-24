require "qqrobot/version"
require 'openssl'
require 'base64'
require 'rest_client'
require 'yajl'
require 'net/http'
require 'uri'
require 'json'

module Qqrobot
  # Your code goes here...
end

directory = File.expand_path(File.dirname(__FILE__))


require File.join(directory, 'qqrobot', 'base')