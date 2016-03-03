class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :name
      t.string :email
      t.integer :sex
      t.string :password_digest

      t.timestamps null: false
      
      t.index :email, unique: true
    end
  end
end
