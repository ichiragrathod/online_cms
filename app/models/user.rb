class User < ApplicationRecord
  validates :name, :phone_number, :address, :city, :reason, :solution, presence: true
  has_many :complaints 
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable, :trackable 
  enum role: [:user, :admin]

  after_initialize :set_default_role, if: :new_record?

  private

  def set_default_role
    self.role ||= :user
  end

  def after_confirmation 
    WelcomeMailer.send_greetings_notification(self).deliver_now
  end
end
