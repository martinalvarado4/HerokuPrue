require 'test_helper'

class NoticionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @noticion = noticions(:one)
  end

  test "should get index" do
    get noticions_url
    assert_response :success
  end

  test "should get new" do
    get new_noticion_url
    assert_response :success
  end

  test "should create noticion" do
    assert_difference('Noticion.count') do
      post noticions_url, params: { noticion: { contenido: @noticion.contenido, tipo: @noticion.tipo, titulo: @noticion.titulo } }
    end

    assert_redirected_to noticion_url(Noticion.last)
  end

  test "should show noticion" do
    get noticion_url(@noticion)
    assert_response :success
  end

  test "should get edit" do
    get edit_noticion_url(@noticion)
    assert_response :success
  end

  test "should update noticion" do
    patch noticion_url(@noticion), params: { noticion: { contenido: @noticion.contenido, tipo: @noticion.tipo, titulo: @noticion.titulo } }
    assert_redirected_to noticion_url(@noticion)
  end

  test "should destroy noticion" do
    assert_difference('Noticion.count', -1) do
      delete noticion_url(@noticion)
    end

    assert_redirected_to noticions_url
  end
end
