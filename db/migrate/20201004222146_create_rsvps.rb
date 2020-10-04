class CreateRsvps < ActiveRecord::Migration[6.0]
  def change
    create_table :rsvps do |t|
      t.integer :event_id
      t.integer :user_id
      t.boolean :going
    end
  end
end
