class CreateCategoryUserTypes < ActiveRecord::Migration
  def change
    create_table :category_user_types do |t|
      t.integer :category_id
      t.integer :user_type_id

      t.timestamps null: false
    end
  end
end
