source "https://rubygems.org"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem "rails", "~> 5.1.4"
gem "jquery-rails"
gem "bootstrap-sass", "3.3.7"
gem "sqlite3"
gem "config"
gem "puma", "~> 3.7"
gem "bcrypt", "3.1.12"
gem "faker", "1.7.3"
gem "carrierwave", "1.2.2"
gem "mini_magick", "4.7.0"
gem "i18n-js"
gem "will_paginate", "3.1.6"
gem "bootstrap-will_paginate", "1.0.0"
gem "sass-rails", "~> 5.0"
gem "uglifier", ">= 1.3.0"
gem "rubocop", "~> 0.49.1", require: false
gem "coffee-rails", "~> 4.2"
gem "turbolinks", "~> 5"
gem "jbuilder", "~> 2.5"

group :development, :test do
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
  gem "capybara", "~> 2.13"
  gem "selenium-webdriver"
end

group :development do
  gem "web-console", ">= 3.3.0"
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
end
group :test do
  gem "rails-controller-testing", "1.0.2"
  gem "minitest", "5.11.3"
  gem "minitest-reporters", "1.1.14"
  gem "guard", "2.13.0"
  gem "guard-minitest", "2.4.4"
end

group :production do
  gem "pg", "0.18.4"
  gem "fog", "1.42"
end

gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
