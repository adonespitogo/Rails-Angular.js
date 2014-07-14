source 'https://rubygems.org'

gem 'devise'
gem "paperclip", "~> 4.1"
gem 'geokit-rails'
gem 'font-awesome-sass'
gem 'angularjs-rails'
gem 'angular-rails-templates'
gem 'rails', '4.1.0'
gem 'pg'
gem 'sass-rails', '~> 4.0.3'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0',          group: :doc

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]

group :development, :test do
  gem "letter_opener" # opening letter in the browser
  gem 'rspec-rails', '~> 3.0.0'
  gem 'faker', '~> 1.4.1'
  gem 'machinist', '>= 2.0.0.beta2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  # gem 'spring'
  gem 'debugger'
end

group :production do
  # heroku suggestions
  ruby '2.0.0'
  gem 'rails_12factor', group: :production
end

