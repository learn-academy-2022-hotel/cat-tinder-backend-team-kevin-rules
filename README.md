# CAT TINDER BACKEND NOTES

 rails new cat-tinder-backend -d postgresql -T
  $  cd cat-tinder-backend
  $  rails db:create
  $  bundle add rspec-rails
  $  rails generate rspec:install
  $  git remote add origin https://github.com/learn-academy-2022-hotel/cat-tinder-backend-team-kevin-rules.git\n
  $  git branch
  $  git checkout -b main
  $  git status
  $  git add .
  $  git commit -m "initial commit"
  $  git push origin main
  $  rails s
  $  git checkout -b backend-structure
  $  rails g resource Cat name:string age:integer enjoys:string image:string
  $  rails db:migrate
  $  code .
  $  rspec spec

  # AFTER ADDING SEEDS

  $ rails db:seed

  # TO RESET THE DB
  $  rails db:drop
  $  rails db:create
  $  rails db:migrate
  $  rails db:seed
 

 # CORS
  What is CORS - Cross-Origin Resource Sharing.  This enables our Rails application to accept requests from the React application.

    We add `skip_before_action :verify_authenticity_token` to our application controller.

    ```ruby
    app/controllers/application_controller.rb

    class ApplicationController < ActionController::Base
      skip_before_action :verify_authenticity_token
    end
    ```

    Add 
    `gem 'rack-cors', :require => 'rack/cors'`  to Gemfile

    Create file called `cors.rb` in config/initializers

    ```ruby
      # Avoid CORS issues when API is called from the frontend app.
      # Handle Cross-Origin Resource Sharing (CORS) in order to accept cross-origin AJAX requests.

      # Read more: https://github.com/cyu/rack-cors

      Rails.application.config.middleware.insert_before 0, Rack::Cors do
        allow do
          origins '*'  # <- change this to allow requests from any domain while in development.

          resource '*',
            headers: :any,
            methods: [:get, :post, :put, :patch, :delete, :options, :head]
          end
        end
    ```

    be sure to run `bundle` when are you done to install the above gem!
    