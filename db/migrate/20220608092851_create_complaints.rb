class CreateComplaints < ActiveRecord::Migration[7.0]
  def up
    create_table :complaints do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name 
      t.string :landmark
      t.string :address 
      t.string :city 
      t.string :complaint
      t.string :reason
      t.string :solution 
      t.integer :complaint_type  
      t.integer :complaint_level 
      t.integer :complaint_status, default: 0  
      t.timestamps
    end
  end
  def down 
  end
  
end
