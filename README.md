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


### Cloning a rails project:
- $ git clone <repo>
- $ cd into <repo>
- $ git pull origin main
- $ git checkout -b api-endpoints
- $ bundle
- $ code .
- $ rails s

- run $ rails db:setup will perform the following three terminal commands
   $ rails db:create
   $ rails db:migrate
   $ rails db:seed

```bash
    - NOTE - $ rails db:reset will perform the following four commands
      $ rails db:drop
      $ rails db:create
      $ rails db:migrate
      $ rails db:seed
```

### Steps to create rails API
1. Create a new rails app - rails will be in charge of controllers and models
2. Enable CORS - Cross Origin Resource Sharing - allows react and rails to communicate
3. Create models, controllers, and routes with a resource generator command
4. Created, migrated, seeded the database
5. Define the controller actions/endpoints: index, create, update, destroy
6. Test API functionality with spec/requests

### Testing process
- Stub the controller action methods/endpoints
```ruby
  def index
  end

  def create
  end

  def update
  end

  def destroy
  end
```
- Create a test in spec/requests
- see good failure
- Modify the controller action with logic  - apps/controllers
- See a valid pass

### API Validations
- Create a test in spec/models
- see good failure
- Modify the model with logic - app/models
- See a valid pass
