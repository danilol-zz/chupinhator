require "chupinhator/version"
require "httparty"

ENV['RACK_ENV'] ||= 'development'

root = File.expand_path(File.dirname(__FILE__))
$: << root
$: << File.expand_path(File.join(File.dirname(__FILE__), '..'))

require 'bundler'
Bundler.require

require 'config/environment'

SOURCE = YAML.load_file("./config/source.yml")

module Chupinhator
  Dir[File.join(File.dirname(__FILE__), 'lib', '*.rb')].each do |f|
    autoload File.basename(f, '.rb').camelize.to_sym, f
  end
end
