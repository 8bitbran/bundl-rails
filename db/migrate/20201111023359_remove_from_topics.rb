class RemoveFromTopics < ActiveRecord::Migration[6.0]
  def change
    remove_column :topics, :group_id
    remove_column :topics, :topic_id
    remove_column :topics, :description
  end
end
