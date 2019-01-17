class ChangePersonIdToUserId < ActiveRecord::Migration[5.1]
  def change
    rename_column :games, :person_id, :user_id
  end
end
