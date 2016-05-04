json.array!(@image_posts) do |image_post|
  json.extract! image_post, :id, :news_post_id, :image_file_name, :image_content_type, :image_file_size, :image_updated_at
  json.url image_post_url(image_post, format: :json)
end
