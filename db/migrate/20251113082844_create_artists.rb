class CreateArtists < ActiveRecord::Migration[8.0]
  def change
    create_table :artists do |t|
      t.string :name
      t.string :country
      t.integer :formed_year
      t.text :biography

      t.timestamps
    end
  end
end
