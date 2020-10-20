class RemoveGoingFromRsvps < ActiveRecord::Migration[6.0]
  def change
    remove_column :rsvps, :going
  end
end
