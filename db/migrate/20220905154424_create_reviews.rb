class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.references :user, null: false, foreign_key: true
      t.references :restaurant, null: false, foreign_key: true
      t.string :emoji
      t.text :content
      t.string :title
      t.string :perfect_for
      t.integer :likes

      t.timestamps
    end
  end
end
