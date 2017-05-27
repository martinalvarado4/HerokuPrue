require 'test_helper'

class ReviewsesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @reviewse = reviewses(:one)
  end

  test "should get index" do
    get reviewses_url
    assert_response :success
  end

  test "should get new" do
    get new_reviewse_url
    assert_response :success
  end

  test "should create reviewse" do
    assert_difference('Reviewse.count') do
      post reviewses_url, params: { reviewse: { comentario: @reviewse.comentario } }
    end

    assert_redirected_to reviewse_url(Reviewse.last)
  end

  test "should show reviewse" do
    get reviewse_url(@reviewse)
    assert_response :success
  end

  test "should get edit" do
    get edit_reviewse_url(@reviewse)
    assert_response :success
  end

  test "should update reviewse" do
    patch reviewse_url(@reviewse), params: { reviewse: { comentario: @reviewse.comentario } }
    assert_redirected_to reviewse_url(@reviewse)
  end

  test "should destroy reviewse" do
    assert_difference('Reviewse.count', -1) do
      delete reviewse_url(@reviewse)
    end

    assert_redirected_to reviewses_url
  end
end
