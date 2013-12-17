source 'https://rubygems.org'

gem 'rails', '3.2.14'
gem 'pg'
gem 'rails_12factor', group: :production
gem 'bcrypt-ruby', '3.0.0'
gem 'carrierwave'
gem "fog", "~> 1.3.1" #required for carrierwave s3


group :development, :test do
  gem 'rspec-rails'
  gem 'shoulda-matchers'
  gem 'simplecov'
  gem 'factory_girl_rails'
  gem 'ffaker'

  gem 'cucumber-rails', :require => false
  gem 'database_cleaner'

  gem 'pry-rails'
  gem 'pry-debugger'
  gem 'pry-stack_explorer'

  gem 'annotate'

  gem 'quiet_assets'
  gem 'better_errors'
  # BetterErrors.editor = :sublime if defined? BetterErrors  (initializer)
  # http://localhost:3000/__better_errors (reports last exception for debugging)
  gem 'binding_of_caller'
  gem 'meta_request'
  # Add RailsPanel extension in the Chrome Web Store

  gem 'sextant' #it lets you look at the routes in the browser (not need to rake routes)
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  # gem 'less-rails-bootstrap'


  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'
gem 'devise'


