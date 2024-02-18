class CreateEvent < ActiveRecord::Migration[7.1]
  def change
    create_table :events do |t|
      t.string :name, null: false
      t.integer :event_type, null: false
      t.string :event_code, null: false

      t.timestamps
    end
  end
end
