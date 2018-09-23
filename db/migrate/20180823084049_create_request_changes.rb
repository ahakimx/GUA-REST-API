class CreateRequestChanges < ActiveRecord::Migration[5.2]
  def change
    create_table :request_changes do |t|
      t.belongs_to :user, index: true
      t.belongs_to :agent, index: true
      t.boolean :status
      t.text :reason
      t.timestamps
    end
  end
end
