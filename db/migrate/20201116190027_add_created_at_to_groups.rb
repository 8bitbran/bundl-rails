class AddCreatedAtToGroups < ActiveRecord::Migration[6.0]
  def change
    add_column :groups, :created_at, :datetime
  end
end
