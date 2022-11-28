require "rails_helper"

class Api::PostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user_one = User.create(email: "#{SecureRandom.hex}@example.com", password: "password")
    @user_two = User.create(email: "#{SecureRandom.hex}@example.com", password: "password")
    @user_one_post = @user_one.reload.posts.create(title: "User One Post", body: "Body")
    @user_two_post = @user_two.reload.posts.create(title: "User One Post", body: "Body")
  end

  class Authenticated < Api::PostsControllerTest
    test "should get posts" do
      assert_difference("Request.count", 1) do
        get api_v1_posts_path, headers: { "Authorization": "Token token=#{@user_one.private_api_key}" }
        assert_equal "application/json; charset=utf-8", @response.content_type
        assert_match  @user_one_post.title, @response.body
        assert_response :ok
      end
    end

    test "should get post" do
      assert_difference("Request.count", 1) do
        get api_v1_post_path(@user_one_post), headers: { "Authorization": "Token token=#{@user_one.private_api_key}" }
        assert_equal "application/json; charset=utf-8", @response.content_type
        assert_match  @user_one_post.title, @response.body
        assert_response :ok
      end
    end

    test "should handle 404" do
      get api_v1_post_path("does_not_exis"), headers: { "Authorization": "Token token=#{@user_one.private_api_key}" }
      assert_equal "application/json; charset=utf-8", @response.content_type
      assert_response :not_found
    end

    test "should create post" do
      assert_difference(["Post.count", "Request.count"], 1) do
        post api_v1_posts_path, headers: { "Authorization": "Token token=#{@user_one.private_api_key}" }, params: { post: { title: "title", body: "body" }  }
        assert_equal "application/json; charset=utf-8", @response.content_type
        assert_match  "title", @response.body
        assert_response :created
      end
    end

    test "should handle errors on create" do
      assert_no_difference("Post.count") do
        assert_difference("Request.count", 1) do
          post api_v1_posts_path, headers: { "Authorization": "Token token=#{@user_one.private_api_key}" }, params: { post: { title: nil, body: nil }  }
          assert_equal "application/json; charset=utf-8", @response.content_type
          assert_match "message", @response.body
          assert_response :unprocessable_entity
        end
      end      
    end

    test "should update post" do
      put api_v1_post_path(@user_one_post), headers: { "Authorization": "Token token=#{@user_one.private_api_key}" }, params: { post: { title: "updated" }  }
      assert_equal "application/json; charset=utf-8", @response.content_type
      assert_match  "updated", @response.body
      assert_response :ok
    end

    test "should handle errors on update" do
      assert_difference("Request.count", 1) do
        put api_v1_post_path(@user_one_post), headers: { "Authorization": "Token token=#{@user_one.private_api_key}" }, params: { post: { title: nil }  }
        assert_equal "application/json; charset=utf-8", @response.content_type
        assert_match "message", @response.body
        assert_response :unprocessable_entity
      end
    end

    test "should delete post" do
      assert_difference(["Post.count"], -1) do
        assert_difference("Request.count", 1) do
          delete api_v1_post_path(@user_one_post), headers: { "Authorization": "Token token=#{@user_one.private_api_key}" }
          assert_equal "application/json; charset=utf-8", @response.content_type
          assert_response :ok
        end
      end
    end
  end

  class Unauthorized < Api::PostsControllerTest
    test "should not get posts" do
      get api_v1_posts_path
      assert_response :unauthorized
    end

    test "should not load another's post" do
      get api_v1_post_path(@user_two_post), headers: { "Authorization": "Token token=#{@user_one.private_api_key}" }
      assert_equal "application/json; charset=utf-8", @response.content_type
      assert_response :unauthorized
    end

    test "should not update another's post" do
      put api_v1_post_path(@user_two_post), headers: { "Authorization": "Token token=#{@user_one.private_api_key}" }, params: { post: { title: "updated" }  }
      assert_equal "application/json; charset=utf-8", @response.content_type
      assert_response :unauthorized
    end

    test "should not delete another's post" do
      assert_no_difference(["Post.count", "Request.count"]) do
        delete api_v1_post_path(@user_two_post), headers: { "Authorization": "Token token=#{@user_one.private_api_key}" }
        assert_equal "application/json; charset=utf-8", @response.content_type
        assert_response :unauthorized
      end
    end
  end

end