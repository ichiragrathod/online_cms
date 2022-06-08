class User < ApplicationRecord
  validates :name, :phone_number, :address, :city, presence: true
  has_many :complaints 
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable, :trackable 
  
  private
  def after_confirmation 
    WelcomeMailer.send_greetings_notification(self).deliver_now
  end
end
