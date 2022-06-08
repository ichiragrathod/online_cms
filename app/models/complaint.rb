class Complaint < ApplicationRecord
  belongs_to :user
  validates :name, :landmark, :address, :city, :complaint, :complaint_type, :complaint_level, presence: true
  enum :complaint_type, [ :"Street Light", :"Pipe Likage", :"Road Damage", :"Garbage", :"Rain Water" ]
  enum :complaint_level, [ :Low, :Medium, :High ]
end
