class ChangeNullToScores < ActiveRecord::Migration
  def change
    change_column_null :scores, :user_id, true
  end
end
