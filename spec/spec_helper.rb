if ENV['CODECLIMATE_REPO_TOKEN']
  require "codeclimate-test-reporter"
  CodeClimate::TestReporter.start
end

require 'konjak'
require 'pry'

# spec/fixtures/sample.tmx from http://www.ttt.org/oscarstandards/tmx/#AppSample

Dir['spec/support/**/*.rb'].each {|path| load path }
