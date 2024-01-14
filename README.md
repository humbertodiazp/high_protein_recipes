HighProtein Recipes 
A social media and fitness diet app built with Ruby on Rails. 

About
HighProtein Recipes iniitially began as a final project for The Odin Project's Ruby on Rails curriculum, but became a larger project intended to help fitness enthusiast's hit their daily macro goals. My approach with this project was to learn as you go. I began by tackling the smallest problems first and working my way up to more complex tasks, such as using turbo streams to render reactive recipe forms where users can add ingredients dynamically, adding recipe ingredients to user generated shopping lists, allowing user's to follow/unfollow each other, notifications, etc. 



Some areas of improvement include a new focus on testing, i.e test driven development. As I came to see first hand how much time can be spent debugging. Other areas I would like to improve on include, finding better ways of organizing my code with the methodology of "Do Not Repeat Yourself" (DRY), and how best to style my website with Tailwind CSS. 

Please feel free to make an issue or contact me at humberto.a.diaz.p@gmail.com if you see any other areas that need improvement. I am always happy to learn new ways to improve and refine my skills. 


Features

Authentication - log in/ log out

- Devise: is used to register new users and create new sessions for existing users 
- OAuth: Allows users to login via their Google account 


Recipes

- Users can create new recipes consisting of ingredients, instructions, and an optional image. 
- Recipes can have comments and likes. 

Ingredients

- Turbo streams allow users to add or delete ingredients without refreshing the recipe page 
- Recipes inherent ingredients from the ingredient model 

Comments
- Nested comments: User's can reply to each other's comments.  
- Turbo streams enable users to add, update, and delete comments without a page-refresh. 
- Stimulus toggles the reply form so that it remains hidden until clicked.  
- Comment counts are displayed on the recipe home and index pages.

Likes 
- Turbo streams allow users to toggle the like / unlike button with no page-refresh.

Profiles

- Profile instances are generated in pair with user instances. 
- Users can update their profile with a location, personal link, bio, name, and profile photo.
- User's can also set the color theme for their profile. 

Followers 

- Users can follow/unfollow other users.
- jQuery is used to prevent page reloads when user's follow or unfollow another user


Feed
- Rendered based on if a user follow's another user. The recipes of that followed users will appear on the  follower's feed, and vice versa. 


Notifications

- Noticed Gem was used to enable notifications for:
    - likes: User's are notified when their recipe receives a like 
    - follows: User's are notified when a new user begins following them 
    - comments: User's receive a notification when a comment is made on their recipe 

Testing

- RSpec/Factory Bots


CSS Framework

- Tailwind CSS
different layout renders if user is logged in or not
profile color is displayed based on users profile settings

Storage
- AWS
- S3: Used to save user pictures. aa

Hosted on Heroku 


Upociming Features 

"Add to menu"
calculate total calories/ grams of protein per day based on selected meals. 
- build custom meal plan's directly from the website. i.e "add to menu" which will add the meal to a selected menu (mondays menu, tuesdays, etc) and help you visualize how many calories/grams of protein  you are getting based on your selected daily meal. 

Save Recipe 
- allow user's to save recipes

Search 
- allow user's to search recipes and other users 
