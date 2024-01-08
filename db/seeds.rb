# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# db/seeds.rb

# Assume the user already exists
existing_user = User.find_by(email: 'hdkaratechop48@gmail.com')

# Create recipes
recipe_names = ['Spaghetti Bolognese', 'Chicken Caesar Salad', 'Vegetarian Stir-Fry', 'Chili Lime Chicken Burritos', 'Philly Cheesesteak Pasta', 'Healthy Banana Bread Overnight Oats', 'Cheesecake Overnight Oats', 'Cheesecake Pancakes' ]
recipe_contents = [
    'Delicious and hearty spaghetti bolognese recipe.',
    'A classic and refreshing chicken caesar salad.',
    'Healthy and flavorful vegetarian stir-fry with tofu and vegetables.',
    'Easy to make, low in calories, PACKED with protein and flavour. Done in 20 minutes! \n +
        Chicken: \n +
        • 2 chicken breast (approx. 300g total) \n +
        • 1 tsp olive oil \n +
        • 1/2 tsp salt, pepper, chili powder, cumin \n +
        • 1 tsp paprika and garlic powder \n +
        • Squeeze of half a lime \n +
        -
        Chili Lime Sauce:\n
        • 3 tbsp light mayo (or 1/4 cup greek yogurt and 1/4 tsp salt) \n +
        • 1 tbsp hot sauce \n +
        • 1/4 tsp chili powder and garlic powder \n +
        • Squeeze of half a lime \n +
        -
        Burritos: \n +
        • 2 large tortillas (approx. 60g) \n +
        • 1/4 cup low fat cheese (I use mozzarella) \n +
        • 1/2 cup shredded lettuce \n +
        • 1 tomato, sliced \n +
        • 1 small red onion, sliced \n +
    Notes:\n
    • If you have the time, zest/grate your lime and add it to your chicken (before cooking) and sauce. The flavour kick is incredible! \n +
    • add more or less hot sauce based on your spice tolerance. \n +
    • feel free to make these in a large batch and store them in the fridge for up to 5 days. Reheat with a microwave or even toast in a pan. \n +
    \n +
    Yields: 2 large burritos \n +
    \n +
    Calories/Macros (per burrito): \n +
    • Approx. 420 calories \n +
    • 44.5g protein \n +
    • 31.5g carbs \n +
    • 12.5g fat \n +
    Link: https://www.instagram.com/reel/Cu2D3CyrGHl/?utm_source=ig_web_copy_link',
    'PACKED with protein, lower in calories, creamy, cheesy and so delicious. Done in 20 minutes!\n
    Pasta: \n +
    • water (to boil) \n +
    • salt \n +
    • 1 & 1/4 cup pasta (any shape, approx 100g) \n +
    - \n +
    Beef Mix: \n +
    • 1 tsp olive oil (or spray) \n +
    • 1 small onion, chopped \n +
    • 1 green bell pepper, chopped \n +
    • 1 cup sliced mushrooms \n +
    • 1 tbsp minced garlic \n +
    • 1 cup lean ground beef or sirloin (the leaner it is, the lower the calories. I use 94% lean) \n +
    • Season with 1 tsp salt, pepper, paprika and chili powder \n +
    • 1/4 cup light cream cheese (I use 95% light) \n +
    • 1/3 cup fat-free Greek yogurt, plain \n +
    • 1/3 cup light mozzarella cheese \n +
    • 1/2 cup pasta water \n +
    - \n +
    Toppings (optional): \n +
    • Cilantro and Chili Flakes \n +
    - \n +
    Notes: \n +
    • For some more traditional flavor, feel free to add provolone cheese, but in moderation due to calories! \n +
    • When mixing the sauce, keep the heat low. \n +
    • Use any type of pasta that fits into your calorie goals such as low-carb, chickpea, veggie, etc. \n +
    • Double the recipe and serve as a meal prep for the week! \n +
    - \n +
    Serving Size: \n +
    • Approx. 2 \n +
    - \n +
    Calories/Macros (Per Serving): \n +
    • Approx. 496 calories \n +
    • 44.5g protein \n +
    • 46g carbs \n +
    • 15.5g fat \n
    
    Link: https://www.instagram.com/p/C1sFNQIuU29/',
    'Fast and easy meal, low in calories, PACKED with protein and so delicious! \n +
    \n +
    Serving Size: \n +
    • 1 serving per jar \n +
    - \n +
    Notes: \n +
    • you can meal prep up to 4 of these at a time for the work week! You can do 5, but you will notice a slight difference in texture. \n +
    • feel free to use your choice of toppings but be mindful of extra calories. \n +
    • extra spices/ingredients that pair well with this include 1/4 tsp ginger, nutmeg and shredded carrots. \n +
    • you can even add more milk when serving if your oats are too thick of a consistency for you! \n +
    - \n +
    Calories/Macros (Per Jar, Without Toppings): \n +
    • Approx. 304 calories \n +
    • 36g Protein \n +
    • 37g Carbs \n +
    • 2g Fat \n
    Link: https://www.instagram.com/p/CzjZc8hufcI/',
    'Meal prep this Cheesecake Overnight Oats in under 10 minutes! Low calorie, high protein, creamy and delicious.\n
    Notes: \n +
    • you can make up to 5 of these and store them in the refrigerator for the entire week. \n +
    • you may substitute the raspberries for any frozen fruit of your choice. Make sure it is one that can break down and melt into a jam! \n +
    • these are great to start your day with, as they are filling yet low in calorie with tons of protein to fuel you. \n +
    - \n +
    Calories/Macros (Per Jar): \n +
    • Approx. 352 calories \n +
    • 40g protein \n +
    • 40g carbs \n +
    • 6g fat \n +
    Link: https://www.instagram.com/p/CyGm4AxOSDE/',
    'Cheesecake Pancakes that are PACKED with 45g protein and done in under 20 minutes. \n +
    \n +
    Yields: 4 pancakes \n +
    - \n +
    Calories/Macros (ENTIRE RECIPE): \n +
    • Approx. 427 Calories \n +
    • 45g Protein \n +
    • 41g Carbs \n +
    • 11g Protein \n +
    Link: https://www.instagram.com/p/CrdyN0bgE7r/ '
]

recipes = []
recipe_names.each_with_index do |name, index|
    recipes << Recipe.create(name: name, content: recipe_contents[index], user: existing_user)
end

# Create ingredients for Spaghetti Bolognese
ingredients_spaghetti = Ingredient.create([
    { description: 'Spaghetti', quantity: '200g', measurement: 'grams', recipe: recipes.first },
    { description: 'Ground beef', quantity: '300g', measurement: 'grams', recipe: recipes.first },
    { description: 'Tomato sauce', quantity: '1 cup', measurement: 'cup', recipe: recipes.first },
    { description: 'Onion', quantity: '1', measurement: 'piece', recipe: recipes.first },
    { description: 'Garlic', quantity: '2 cloves', measurement: 'cloves', recipe: recipes.first },
    { description: 'Olive oil', quantity: '2 tablespoons', measurement: 'tablespoons', recipe: recipes.first },
])

# Create ingredients for Chicken Caesar Salad
ingredients_caesar_salad = Ingredient.create([
    { description: 'Chicken breasts', quantity: '2', measurement: 'pieces', recipe: recipes.second },
    { description: 'Romaine lettuce', quantity: '1 head', measurement: 'head', recipe: recipes.second },
    { description: 'Croutons', quantity: '1 cup', measurement: 'cup', recipe: recipes.second },
    { description: 'Parmesan cheese', quantity: '1/2 cup', measurement: 'cup', recipe: recipes.second },
    { description: 'Caesar dressing', quantity: '1/4 cup', measurement: 'cup', recipe: recipes.second },
])

# Create ingredients for Vegetarian Stir-Fry
ingredients_stir_fry = Ingredient.create([
    { description: 'Tofu', quantity: '250g', measurement: 'grams', recipe: recipes.third },
    { description: 'Broccoli', quantity: '1 head', measurement: 'head', recipe: recipes.third },
    { description: 'Carrots', quantity: '2', measurement: 'pieces', recipe: recipes.third },
    { description: 'Bell peppers', quantity: '2', measurement: 'pieces', recipe: recipes.third },
    { description: 'Soy sauce', quantity: '3 tablespoons', measurement: 'tablespoons', recipe: recipes.third },
    { description: 'Sesame oil', quantity: '1 tablespoon', measurement: 'tablespoon', recipe: recipes.third },
])

ingredients_array = Ingredient.create([
    { description: '2 chicken breast', quantity: '', measurement: '', recipe: recipes.fourth },
    { description: '1 tsp olive oil', quantity: '', measurement: '', recipe: recipes.fourth },
    { description: '1/2 tsp salt', quantity: '', measurement: '', recipe: recipes.fourth },
    { description: '1/2 tsp pepper', quantity: '', measurement: '', recipe: recipes.fourth },
    { description: '1/2 tsp chili powder', quantity: '', measurement: '', recipe: recipes.fourth },
    { description: '1/2 tsp cumin', quantity: '', measurement: '', recipe: recipes.fourth },
    { description: '1 tsp garlic powder', quantity: '', measurement: '', recipe: recipes.fourth },
    { description: '1 tsp paprika', quantity: '', measurement: '', recipe: recipes.fourth },
    { description: 'Squeeze of half a lime', quantity: '', measurement: '', recipe: recipes.fourth}, 
    { description: '3 tbsp light mayo', quantity: '', measurement: '', recipe: recipes.fourth },
    { description: '1 tbsp hot sauce', quantity: '', measurement: '', recipe: recipes.fourth },
    { description: '1/4 tsp chili powder', quantity: '', measurement: '', recipe: recipes.fourth },
    { description: '1/4 tsp garlic powder', quantity: '', measurement: '', recipe: recipes.fourth },
    { description: 'Squeeze of half a lime', quantity: '', measurement: '', recipe: recipes.fourth },
    { description: '2 large tortillas', quantity: '', measurement: '', recipe: recipes.fourth },
    { description: '1/4 cup low fat cheese', quantity: '', measurement: '', recipe: recipes.fourth },
    { description: '1/2 cup shredded lettuce', quantity: '', measurement: '', recipe: recipes.fourth },
    { description: '1 tomato', quantity: '', measurement: '', recipe: recipes.fourth },
    { description: '1 small red onion', quantity: '', measurement: '', recipe: recipes.fourth }
])


ingredients_array = Ingredient.create([
    { description: '2 cups water', quantity: '', measurement: '', recipe: recipes.fifth },
    { description: '1 tsp salt', quantity: '', measurement: '', recipe: recipes.fifth },
    { description: '1 & 1/4 cup any pasta', quantity: '', measurement: '', recipe: recipes.fifth },
    { description: '1 tsp olive oil', quantity: '', measurement: '', recipe: recipes.fifth },
    { description: '1 small onion', quantity: '', measurement: '', recipe: recipes.fifth },
    { description: '1 green bell pepper', quantity: '', measurement: '', recipe: recipes.fifth },
    { description: '1 cup mushrooms', quantity: '', measurement: '', recipe: recipes.fifth },
    { description: '1 tbsp minced garlic', quantity: '', measurement: '', recipe: recipes.fifth },
    { description: '1 cup lean ground beef', quantity: '', measurement: '', recipe: recipes.fifth },
    { description: '1 tsp salt', quantity: '', measurement: '', recipe: recipes.fifth },
    { description: '1 tsp pepper', quantity: '', measurement: '', recipe: recipes.fifth },
    { description: '1 tsp paprika', quantity: '', measurement: '', recipe: recipes.fifth },
    { description: '1 tsp chili powder', quantity: '', measurement: '', recipe: recipes.fifth },
    { description: '1/4 cup light cream cheese', quantity: '', measurement: '', recipe: recipes.fifth },
    { description: '1/3 cup fat free greek yogurt', quantity: '', measurement: '', recipe: recipes.fifth },
    { description: '1/3 cup light mozzarella cheese', quantity: '', measurement: '', recipe: recipes.fifth },
])

ingredients_array = Ingredient.create([
    { description: '1/3 cup rolled oats', quantity: '', measurement: '', recipe: recipes.sixth },
    { description: '1/2 cup fat free greek yogurt', quantity: '', measurement: '', recipe: recipes.sixth },
    { description: '1/2 mashed banana', quantity: '', measurement: '', recipe: recipes.sixth },
    { description: '1/2 tsp cinnamon', quantity: '', measurement: '', recipe: recipes.sixth },
    { description: '1/4 tsp vanilla extract', quantity: '', measurement: '', recipe: recipes.sixth },
    { description: '1 tbsp any sweetener', quantity: '', measurement: '', recipe: recipes.sixth },
    { description: '1 scoop vanilla protein powder', quantity: '', measurement: '', recipe: recipes.sixth }
])

ingredients_array = Ingredient.create([
    { description: '1/3 cup rolled oats', quantity: '', measurement: '', recipe: recipes.seventh },
    { description: '1/2 cup fat free greek yogurt, plain', quantity: '', measurement: '', recipe: recipes.seventh },
    { description: '1/4 cup any milk', quantity: '', measurement: '', recipe: recipes.seventh },
    { description: '1 tbsp light cream cheese', quantity: '', measurement: '', recipe: recipes.seventh },
    { description: '1/4 tsp vanilla extract', quantity: '', measurement: '', recipe: recipes.seventh },
    { description: '1 tbsp any sweetener', quantity: '', measurement: '', recipe: recipes.seventh },
    { description: '1 scoop vanilla protein powder', quantity: '', measurement: '', recipe: recipes.seventh },
    { description: '1/8 tsp salt)', quantity: '', measurement: '', recipe: recipes.seventh },
    { description: '1 cup frozen raspberries', quantity: '', measurement: '', recipe: recipes.seventh },
    { description: '1 tbsp honey', quantity: '', measurement: '', recipe: recipes.seventh },
    { description: '2 tspn granola/cereal', quantity: '', measurement: '', recipe: recipes.seventh }
])

ingredients_array = Ingredient.create([
    { description: '1/2 cup rolled oats', quantity: '', measurement: '', recipe: recipes.eighth },
    { description: '1/4 cup milk', quantity: '', measurement: '', recipe: recipes.eighth },
    { description: '1/4 cup egg whites', quantity: '', measurement: '', recipe: recipes.eighth },
    { description: '1 tbsp light cream cheese', quantity: '', measurement: '', recipe: recipes.eighth },
    { description: '1/2 tsp baking powder', quantity: '', measurement: '', recipe: recipes.eighth },
    { description: '1/4 tsp baking soda', quantity: '', measurement: '', recipe: recipes.eighth },
    { description: '2 tbsp low calorie maple syrup', quantity: '', measurement: '', recipe: recipes.eighth },
    { description: '1 scoop vanilla protein powder', quantity: '', measurement: '', recipe: recipes.eighth },
    { description: '1 tsp olive oil', quantity: '', measurement: '', recipe: recipes.eighth },
    { description: '1/3 cup frozen blueberries', quantity: '', measurement: '', recipe: recipes.eighth },
    { description: '1/2 tsp honey', quantity: '', measurement: '', recipe: recipes.eighth },
    { description: '1/3 cup fat free greek yogurt, plain', quantity: '', measurement: '', recipe: recipes.eighth },
    { description: '1/2 scoop vanilla protein powder', quantity: '', measurement: '', recipe: recipes.eighth }
])




puts 'Recipes and ingredients have been created successfully!'


# # Create likes
# likes = Like.create([
#   { user: existing_user, record: recipes.first },
#   { user: existing_user, record: recipes.second },
#   # Add more likes as needed
# ])

# Create profiles
# profiles = Profile.create([
#   { user: existing_user, location: 'City One', bio: 'Food lover', link: 'https://example.com/user1', color: '#FF5733' },
#   # Add more profiles as needed
# ])

# # Create shopping lists
# shopping_lists = ShoppingList.create([
#   { name: 'Weekly Groceries', user: existing_user },
#   { name: 'Special Ingredients', user: existing_user },
#   # Add more shopping lists as needed
# ])

# # Create shopping list items
# shopping_list_items = ShoppingListItem.create([
#   { description: 'Milk', shopping_list: shopping_lists.first, ingredient: ingredients.first },
#   { description: 'Spinach', shopping_list: shopping_lists.second, ingredient: ingredients.second },
#   # Add more shopping list items as needed
# ])

# Additional seed data for other tables can be added similarly

puts 'Seed data has been created successfully!'
