require "test_helper"

describe PostsController do
  it "should get new" do
    get posts_new_url
    value(response).must_be :success?
  end

  it "should get edit" do
    get posts_edit_url
    value(response).must_be :success?
  end

  it "should get delete" do
    get posts_delete_url
    value(response).must_be :success?
  end

end
