class Complaint < ApplicationRecord
  belongs_to :user
  validates :name, :landmark, :address, :city, :complaint, :complaint_type, :complaint_level, presence: true
  enum :complaint_type, [ :"Street Light", :"Pipe Likage", :"Road Damage", :"Garbage", :"Rain Water" ]
  enum :complaint_level, [ :Low, :Medium, :High ]
  enum :complaint_status, [ :Pending, :"On Progress", :Rejected, :Completed]
end
