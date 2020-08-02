class CreateRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes do |t|
      t.string :title, null: false
      t.text :body, null: false
      t.string :time, null: false
      t.string :image_id, null: false
      t.integer :user_id, null: false

      t.timestamps
    end
  end
end
