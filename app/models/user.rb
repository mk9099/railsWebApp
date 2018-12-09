class User < ApplicationRecord

   has_many :foods      #each user can uplaod several foods
   has_many :reivews    #each user can have many reviews
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,   #this devise is for users, when they log in, register etc.
         :recoverable, :rememberable, :validatable
end
