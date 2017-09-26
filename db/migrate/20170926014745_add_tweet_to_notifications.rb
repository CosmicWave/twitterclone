class AddTweetToNotifications < ActiveRecord::Migration[5.1]
  def change
    add_column :notifications, :tweet, :string
  end
end
