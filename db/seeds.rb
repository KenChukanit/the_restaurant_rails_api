# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.delete_all
Food.delete_all
Review.delete_all


NUM_FOODS=15
NUM_USER=10

PASSWORD='supersecret'
super_user= User.create(
    username: 'Ken21',
    email: 'chonlasek.c@gmail.com',
    password: 'concon',
    phone_number: '6041234567',
    address:   '628 6th Avenue, New Westminster, BC, Canada',
    isStaff: true
)
address_array = ["3364 Cambie StVancouver, BC Canada",
                "820 6th St, New Westminster, BC Canada",
                "7171 Minoru Blvd, Richmond, BC Canada"
                ]

NUM_USER.times do
    username= Faker::Name.first_name 
  
    User.create(
        username: username,
        email: "#{username}@example.com",
        password: PASSWORD,
        phone_number: Faker::PhoneNumber.cell_phone,
        address: address_array.sample
    )
    end
users=User.all

food_name_array = ["Pad Kra Pao", "Shrimp Cake", "Satay Chicken", 
                    "Spring Roll", "Som Tum", "Grilled Whole Chicken",
                    "Cashewnut Chicken", "Massaman Curry", "Yellw Curry",
                    "Fried Rice", "Red Curry", "Green Curry", "Tom Kah",
                    "Pad Thai", "Tom Yum"
                ]

food_img_url_array = ["https://img.taste.com.au/-YB6C7b2/w720-h480-cfill-q80/taste/2020/07/marion-thai-stir-fry-163887-1.jpg",
                        "https://www.seriouseats.com/recipes/images/20120507-204707-thai-shrimp-cakes-recipe.jpg",
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSQAUaQ5B4kIYQE-2ulJAvUCc6UGtsx56gYCA&usqp=CAU",
                        "https://hot-thai-kitchen.com/wp-content/uploads/2014/10/Spring-Roll-Web.jpg",
                        "https://www.thespruceeats.com/thmb/iIrH0r8nUKAm4BGfPnVTse4Ib-M=/2336x1913/filters:fill(auto,1)/som-tum-rick-poon-586aafa23df78ce2c3522a50.jpg",
                        "https://thewoksoflife.com/wp-content/uploads/2020/06/Thai-grilled-chicken-gai-yang-14.jpg",
                        "https://preview.redd.it/jqm6vdnm59a51.jpg?width=3024&format=pjpg&auto=webp&s=bba06b449c9e74c65849046de78a162661dacf56",
                        "https://rasamalaysia.com/wp-content/uploads/2008/11/beef-massaman-thumb-480x480.jpg",
                        "https://cdn.shopify.com/s/files/1/0076/4339/8233/files/thai-yellow-curry-recipe-744x547-min.jpg?v=1542712302",
                        "https://www.thespruceeats.com/thmb/9VccEgu-9RhW8HDzpxvFfCQ6om0=/1696x954/smart/filters:no_upscale()/Thaishrimpfriedrice-GettyImages-186826982-599d09896f53ba00101efba7.jpg",
                        "https://images.immediate.co.uk/production/volatile/sites/30/2020/08/thai-red-curry-34c1e6d.jpg",
                        "https://sparkpeo.hs.llnwd.net/e2/guid/Thai-Green-Curry-With-Chicken/863b4d39-c73b-4152-9d63-6feb18925c5a.jpg",
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQqmVCSEW-yYk8uHOQe0mRzRrVPHihJG8RDLw&usqp=CAU",
                        "https://ourthai.ca/wp-content/uploads/2019/11/padthai-1.jpg",
                        "https://i0.wp.com/www.valerieskeepers.com/wp-content/uploads/2015/06/tom-yum-12-1-sur-1.jpg?resize=2048%2C1849"
                    ]

food_ingredients_array = ["grounded chicken, green bean, pepper, onion, served with fried egg",
                        "shrimps, bread crumb, onion, cilantro",
                        "chicken tender, tumeric, coconut milk, lemongrass, gualanga, served with peanut sauce",
                        "cabbage, glass noddle, carrot, onion, spring roll wrapper, soy sauce",
                        "papaya, carrot, peanut, green bean, fish sauce, palm sugar, lime, dried shrimp",
                        "whole chicken, celery, garlic, oyster sauce, fish sauce",
                        "chicken, cashew nut, pepper, onion, carrot, chilli paste",
                        "beef, potato, onion, chilli paste, coconut milk",
                        "chicken, yam, onion, pepper, coconut milk, tumeric, yellow chilli paste",
                        "prawns, green pea, carrot, onion, rice",
                        "Red chilli, Thai chilli paste, pepper, bamboo, chicken, coconut milk, basil leaves",
                        "Thai Chilli paste, eggplants, chicken, pepper, chilli, basil leaves",
                        "chicken, mushrooms, lemongrass and coconut milk",
                        "Prawns, bean sprouts, noodles, green onion, carrot, lime",
                        "Prawns, mushrooms, tomato, lemongrass and Thai spices"
                            ]
    i = 0
NUM_FOODS.times do
    
    f=FOOD.create(
        food_name: food_name_array[i],
        img_url: food_img_url_array[i],
        ingredients: food_ingredients_array[i],
        price: rand(10..20)
      
    )
    i = i+1
# puts q.errors.full_messages
    if f.valid?
        f.reviews = rand(0..15).times.map do 
            Review.new(
                body: Faker::GreekPhilosophers.quote, 
                rating: rand(1..5),
                user: users.sample )
        end
    
    end
end

foods = Food.all
reviews = Review.all

puts Cowsay.say("Generated #{foods.count} foods.",:frogs)
puts Cowsay.say("Generated #{reviews.count} reviews.",:tux)
puts Cowsay.say("Generated #{users.count} users.",:beavis)