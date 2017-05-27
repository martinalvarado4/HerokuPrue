require 'test_helper'

class VistosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @visto = vistos(:one)
  end

  test "should get index" do
    get vistos_url
    assert_response :success
  end

  test "should get new" do
    get new_visto_url
    assert_response :success
  end

  test "should create visto" do
    assert_difference('Visto.count') do
      post vistos_url, params: { visto: {  } }
    end

    assert_redirected_to visto_url(Visto.last)
  end

  test "should show visto" do
    get visto_url(@visto)
    assert_response :success
  end

  test "should get edit" do
    get edit_visto_url(@visto)
    assert_response :success
  end

  test "should update visto" do
    patch visto_url(@visto), params: { visto: {  } }
    assert_redirected_to visto_url(@visto)
  end

  test "should destroy visto" do
    assert_difference('Visto.count', -1) do
      delete visto_url(@visto)
    end

    assert_redirected_to vistos_url
  end
end
