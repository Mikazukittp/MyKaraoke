class CreateUserTypes < ActiveRecord::Migration
  def change
    create_table :user_types do |t|
      t.integer :generation_id, null: false
      t.integer :gender_id, null: false

      t.timestamps null: false
    end
  end
end
