class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable, 
          :omniauthable, omniauth_providers: [:google_oauth2]

  validates_uniqueness_of :email 
  has_many :recipes
  has_many :shopping_lists
  has_many :comments
  has_many :likes, as: :record  
  has_many :active_relationships,  class_name:  "Relationship",
                                  foreign_key: "follower_id",
                                  dependent:   :destroy
  has_many :passive_relationships, class_name:  "Relationship",
                                  foreign_key: "followed_id",
                                  dependent:   :destroy
  has_many :following, through: :active_relationships,  source: :followed
  has_many :followers, through: :passive_relationships, source: :follower
  # notifications
  has_many :notifications, as: :recipient, dependent: :destroy
 
  
  has_one :profile, dependent: :destroy 


  
  
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email #assuming the user model has an email
      user.password = Devise.friendly_token[0,20] #random password the user
      user.full_name = auth.info.name #assuming the user model has a name
      user.avatar_url = auth.info.image #assuming the user model has an image
    end 
  end

  # Returns a user's status feed.
  def feed
    following_ids = "SELECT followed_id FROM relationships
                    WHERE  follower_id = :user_id"
    Recipe.where("user_id IN (#{following_ids})
                    OR user_id = :user_id", user_id: id)
  end


  # Follows a user.
  def follow(other_user)
    relationship = active_relationships.create(followed_id: other_user.id)
    notify other_user, relationship
    
    # :new_follower, recipient: other_user, actor: self, related: relationship
  end

  # def notification_count
  #   notifications.count
  # end

  # Unfollows a user.
  def unfollow(other_user)
    active_relationships.find_by(followed_id: other_user.id).destroy
  end

  # Returns true if the current user is following the other user.
  def following?(other_user)
    following.include?(other_user)
  end

end
