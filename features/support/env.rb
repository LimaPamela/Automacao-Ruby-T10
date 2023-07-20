require 'capybara/cucumber'
require 'capybara/rspec'
require 'selenium-webdriver'
require 'site_prism'
require 'pry'
require_relative 'prints.rb'
require_relative 'page_helpers.rb'

ENVIROMENT  = ENV['ENVIROMENT']
puts "Enviroment >> #{ENVIROMENT}"

CONFIG = YAML.load_file(File.dirname(__FILE__) + "/enviroment/#{ENVIROMENT}.yml")
World(Prints, Pages)

Capybara.configure do |config|
  config.default_driver = :selenium_chrome
  config.app_host = CONFIG['url_default']
  config.default_max_wait_time = 10
end