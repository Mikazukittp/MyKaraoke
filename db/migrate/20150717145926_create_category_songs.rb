class CreateCategorySongs < ActiveRecord::Migration
  def change
    create_table :category_songs do |t|
      t.integer :category_id
      t.integer :song_id

      t.timestamps null: false
    end
  end
end
