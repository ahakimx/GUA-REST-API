class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.belongs_to :subject_comment, index: true
      t.belongs_to :agent, index: true
      t.belongs_to :user, index: true
      t.text :content
      t.integer :rating
      t.boolean :read
      t.date :date_read
      t.timestamps
    end
  end
end
