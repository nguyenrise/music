class CreateReviews < ActiveRecord::Migration[8.0]
  def change
    create_table :reviews do |t|
      t.references :album, null: false, foreign_key: true
      t.string :reviewer_name
      t.integer :rating
      t.text :comment
      t.date :review_date

      t.timestamps
    end
  end
end
