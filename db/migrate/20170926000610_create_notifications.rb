class CreateNotifications < ActiveRecord::Migration[5.1]
  def change
    create_table :notifications do |t|
      t.string :notify
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
