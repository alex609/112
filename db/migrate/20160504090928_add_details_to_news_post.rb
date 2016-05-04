class AddDetailsToNewsPost < ActiveRecord::Migration
  def change
    add_column :news_posts, :user_id, :integer
  end
end
