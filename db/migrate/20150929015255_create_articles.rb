class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.string :content
      t.string :city
      t.string :street
      t.string :state
      t.string :country
      t.integer :user_id
      t.integer :city_id

      t.timestamps null: false
    end
  end
end
