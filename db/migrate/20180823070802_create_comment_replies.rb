class CreateCommentReplies < ActiveRecord::Migration[5.2]
  def change
    create_table :comment_replies do |t|
      t.belongs_to :comment, index: true
      t.references :commentable, polymorphic: true, index: true
      t.text :content
      t.boolean :read
      t.timestamps
    end
  end
end
