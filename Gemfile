# frozen_string_literal: true

source 'https://rubygems.org'
ruby File.read(File.join(File.dirname(__FILE__), '.ruby-version')).chomp

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

gem 'nanoc'

group :nanoc do
  gem 'guard-nanoc'
  gem 'kramdown'
  gem 'sass'
end

group :development do
  gem 'adsf'
  gem 'adsf-live'
end
