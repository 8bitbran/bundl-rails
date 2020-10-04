class CreateTopics < ActiveRecord::Migration[6.0]
  def change
    create_table :topics do |t|
      t.string :title
      t.string :description
      t.integer :group_id
      t.integer :topic_id
    end
  end
end
