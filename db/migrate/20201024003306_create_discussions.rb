class CreateDiscussions < ActiveRecord::Migration[6.0]
  def change
    create_table :discussions do |t|
      t.text :content
      t.integer :group_id
      t.integer :user_id

      t.timestamps
    end
  end
end
