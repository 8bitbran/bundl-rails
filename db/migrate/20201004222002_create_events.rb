class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.integer :group_id
      t.string :title
      t.text :description
      t.string :location
    end
  end
end
