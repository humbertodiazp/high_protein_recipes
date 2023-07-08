class User < ApplicationRecord
  validates :username, presence: true

  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable, :authentication_keys => [:email, :username]

  validates_uniqueness_of :username, :email 
  
end
