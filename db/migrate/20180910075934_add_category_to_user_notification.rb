class AddCategoryToUserNotification < ActiveRecord::Migration[5.2]
  def change
    add_column :user_notifications, :category, :integer
  end
end
