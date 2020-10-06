class AddTimeToEvents < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :starttime, :datetime
    add_column :events, :endtime, :datetime
  end
end
