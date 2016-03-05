class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.references :person, index: true, foreign_key: true
      t.text :content

      t.timestamps null: false
      t.index [:person_id, :created_at]
    end
  end
end
