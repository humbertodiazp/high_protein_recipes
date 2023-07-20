class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable, 
          :omniauthable, omniauth_providers: [:google_oauth2]

  validates_uniqueness_of :email 

  has_many :recipes, dependent: :destroy

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email #assuming the user model has an email
      user.password = Devise.friendly_token[0,20] #random password for the user
      user.full_name = auth.info.name #assuming the user model has a name
      user.avatar_url = auth.info.image #assuming the user model has an image
      #if you are using confirmable and the provider(s) you use validate emails, 
      # uncomment the line below to skip the confirmation emails.
      # user.skip_confirmation!
    end
  end

end
