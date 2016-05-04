require 'test_helper'

class ImagePostsControllerTest < ActionController::TestCase
  setup do
    @image_post = image_posts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:image_posts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create image_post" do
    assert_difference('ImagePost.count') do
      post :create, image_post: { image_content_type: @image_post.image_content_type, image_file_name: @image_post.image_file_name, image_file_size: @image_post.image_file_size, image_updated_at: @image_post.image_updated_at, news_post_id: @image_post.news_post_id }
    end

    assert_redirected_to image_post_path(assigns(:image_post))
  end

  test "should show image_post" do
    get :show, id: @image_post
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @image_post
    assert_response :success
  end

  test "should update image_post" do
    patch :update, id: @image_post, image_post: { image_content_type: @image_post.image_content_type, image_file_name: @image_post.image_file_name, image_file_size: @image_post.image_file_size, image_updated_at: @image_post.image_updated_at, news_post_id: @image_post.news_post_id }
    assert_redirected_to image_post_path(assigns(:image_post))
  end

  test "should destroy image_post" do
    assert_difference('ImagePost.count', -1) do
      delete :destroy, id: @image_post
    end

    assert_redirected_to image_posts_path
  end
end
