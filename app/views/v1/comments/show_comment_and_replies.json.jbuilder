json.comment @comments
json.replies @comments.comment_replies do |comment|
  json.content comment.content
end
