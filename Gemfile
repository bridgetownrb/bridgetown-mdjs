# frozen_string_literal: true

source "https://rubygems.org"
gemspec

gem "rake"
gem "bridgetown", ENV["BRIDGETOWN_VERSION"] if ENV["BRIDGETOWN_VERSION"]

group :test do
  gem "minitest"
  gem "minitest-reporters"
end
