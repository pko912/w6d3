class CreateArtwork < ActiveRecord::Migration[7.0]
  def change
    create_table :artworks do |t|
      t.string :title, null: false
      t.string :image_url, null: false
      t.bigint :artist_id, null: false
      t.index [:title, :artist_id], unique: true

      t.timestamps
    end

    add_index :artworks, :artist_id
    add_foreign_key :artworks, :users, column: :artist_id, primary_key: :id

  end
end
