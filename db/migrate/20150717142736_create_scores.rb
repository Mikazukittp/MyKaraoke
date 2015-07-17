class CreateScores < ActiveRecord::Migration
  def change
    create_table :scores do |t|
      t.integer :user_id, null: false
      t.integer :category_id, null: false
      t.integer :song_id, null: false

      t.timestamps null: false
    end
  end
end
