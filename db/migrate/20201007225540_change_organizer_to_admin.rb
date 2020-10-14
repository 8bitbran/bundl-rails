class ChangeOrganizerToAdmin < ActiveRecord::Migration[6.0]
  def change
    rename_column :groups, :organizer_id, :admin_id
  end
end
