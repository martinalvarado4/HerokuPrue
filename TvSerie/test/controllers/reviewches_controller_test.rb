require 'test_helper'

class ReviewchesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @reviewch = reviewches(:one)
  end

  test "should get index" do
    get reviewches_url
    assert_response :success
  end

  test "should get new" do
    get new_reviewch_url
    assert_response :success
  end

  test "should create reviewch" do
    assert_difference('Reviewch.count') do
      post reviewches_url, params: { reviewch: { comentario: @reviewch.comentario } }
    end

    assert_redirected_to reviewch_url(Reviewch.last)
  end

  test "should show reviewch" do
    get reviewch_url(@reviewch)
    assert_response :success
  end

  test "should get edit" do
    get edit_reviewch_url(@reviewch)
    assert_response :success
  end

  test "should update reviewch" do
    patch reviewch_url(@reviewch), params: { reviewch: { comentario: @reviewch.comentario } }
    assert_redirected_to reviewch_url(@reviewch)
  end

  test "should destroy reviewch" do
    assert_difference('Reviewch.count', -1) do
      delete reviewch_url(@reviewch)
    end

    assert_redirected_to reviewches_url
  end
end
