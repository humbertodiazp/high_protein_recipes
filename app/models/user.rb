class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable, 
          :omniauthable, omniauth_providers: [:google_oauth2]

  validates_uniqueness_of :email 

end
