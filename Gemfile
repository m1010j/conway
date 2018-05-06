source 'https://rubygems.org'
ruby '2.3.1'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

group :development, :test do
  gem 'rspec', '3.7.0'
  gem 'byebug', '10.0.2'
end

group :development do
  gem 'pry', '0.11.3'
end