Rails.application.config.middleware.insert_before 0, Rack::Cors do
    allow do
      origins '127.0.0.1:5500', 'localhost:5500', 'https://rails-the-restaurant.herokuapp.com/' 
      resource(
        '/api/*', 
        headers: :any, 
        credentials: true, 
        methods: [:get, :post, :patch, :put, :options, :delete, :head] 
      )
    end
   
  end