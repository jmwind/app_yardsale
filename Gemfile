source "https://rubygems.org"
ruby "2.1.5"

gem "rails",                    '4.2.0'
gem "shopify_app",              '~> 5.0.2'
gem 'underscore-rails',         '1.8.2'
gem 'jquery-rails',             '4.0.3'
gem 'turbolinks',               '2.3.0'
gem "bugsnag"
gem "quiet_assets"

group :assets do
  gem "sass-rails"
  gem "coffee-rails"
  gem "uglifier", ">= 1.0.3"
end

group :development, :test do
  gem "thin"
  gem "less-rails-bootstrap"
  gem "therubyracer", platforms: :ruby
  gem "pry-rails"
  gem "sqlite3"
  gem 'minitest-reporters', '1.0.5'
  gem 'mini_backtrace',     '0.1.3'
  gem 'guard-minitest',     '2.3.1'
end

group :production do
  gem "pg"
  gem 'rails_12factor', '0.0.2'
  gem 'puma',           '2.11.1'
end
