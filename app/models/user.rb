class User < ApplicationRecord
  validates :name, :phone_number, :address, :city, presence: true
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable, :trackable   
end
