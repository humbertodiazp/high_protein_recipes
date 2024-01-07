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
recipe_names = ['Spaghetti Bolognese', 'Chicken Caesar Salad', 'Vegetarian Stir-Fry']
recipe_contents = [
  'Delicious and hearty spaghetti bolognese recipe.',
  'A classic and refreshing chicken caesar salad.',
  'Healthy and flavorful vegetarian stir-fry with tofu and vegetables.'
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
