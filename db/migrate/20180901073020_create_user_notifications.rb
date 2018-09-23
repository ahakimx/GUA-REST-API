class CreateUserNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :user_notifications do |t|
      t.integer :recipient_id, index: true
      t.integer :actor_id, index: true
      t.datetime :read_at
      t.string :action
      t.references :unotifable, polymorphic: true, index: true
      t.timestamps
    end
  end
end
