class CreateSearches < ActiveRecord::Migration[6.0]
  def change
    create_table :searches do |t|
      t.string :name
      t.string :topic
      t.string :tag
      t.timestamps
    end
  end
end
