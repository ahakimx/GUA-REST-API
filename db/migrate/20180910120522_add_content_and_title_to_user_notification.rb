class AddContentAndTitleToUserNotification < ActiveRecord::Migration[5.2]
  def change
    add_column :user_notifications, :content, :string
    add_column :user_notifications, :title, :string
  end
end
