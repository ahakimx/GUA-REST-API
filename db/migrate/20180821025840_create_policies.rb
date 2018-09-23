class CreatePolicies < ActiveRecord::Migration[5.2]
  def change
    create_table :policies do |t|
      t.belongs_to :agent, index: true
      t.belongs_to :user, index: true
      t.belongs_to :insurance_category, index: true
      t.string :policy_id
      t.float :premium
      t.date :insurance_due_date
      t.string :policy
      t.date :register_date
      t.date :premium_date
      t.string :guarantee_number
      t.timestamps
    end
  end
end
