Rails.application.config.middleware.insert_before 0, Rack::Cors do
    allow do
      origins '*' 
      resource(
        '/api/*', 
        headers: :any, 
        credentials: true, 
        methods: [:get, :post, :patch, :put, :options, :delete, :head] 
      )
    end
   
  end