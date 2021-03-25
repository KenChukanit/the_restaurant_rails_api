Rails.application.config.middleware.insert_before 0, Rack::Cors do
    allow do
      origins '*', 'localhost:3000', 'https://rails-the-restaurant.herokuapp.com','https://the-restaurant-client.herokuapp.com','https://project-1-the-restaurant.vercel.app' 
      resource(
        '/api/*', 
        headers: :any, 
        credentials: true, 
        methods: [:get, :post, :patch, :put, :options, :delete, :head] 
      )
    end
   
  end