class ChangeAdminIdToUserId < ActiveRecord::Migration[6.0]
  def change
    rename_column :groups, :admin_id, :user_id
  end
end
