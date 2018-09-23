class CreateAdminNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :admin_notifications do |t|
      t.integer :recipient_id, index: true
      t.integer :actor_id, index: true
      t.datetime :read_at
      t.string :action
      t.references :anotifable, polymorphic: true, index: true
      t.timestamps
    end
  end
end
