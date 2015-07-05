class CreateDevices < ActiveRecord::Migration
  def change
    create_table :devices do |t|
      t.string :reg_id
      t.string :user_id
      t.string :os

      t.timestamps null: false
    end
  end
end
