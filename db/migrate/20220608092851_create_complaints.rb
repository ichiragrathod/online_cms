class CreateComplaints < ActiveRecord::Migration[7.0]
  def change
    create_table :complaints do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name 
      t.string :landmark
      t.string :address 
      t.string :city 
      t.string :complaint
      t.integer :complaint_type  
      t.integer :complaint_level 
      t.timestamps
    end
  end
end
