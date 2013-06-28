class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :uid
      t.string :gravatar_id
      t.string :fullname
      t.string :location
      t.string :language
      t.integer :followers
      t.integer :contribution
      
      t.timestamps
    end
  end
end
