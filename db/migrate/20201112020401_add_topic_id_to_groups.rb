class AddTopicIdToGroups < ActiveRecord::Migration[6.0]
  def change
    add_column :groups, :topic_id, :integer
  end
end
