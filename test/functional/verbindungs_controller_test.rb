require 'test_helper'

class VerbindungsControllerTest < ActionController::TestCase
  setup do
    @verbindung = verbindungs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:verbindungs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create verbindung" do
    assert_difference('Verbindung.count') do
      post :create, verbindung: { name: @verbindung.name, ort: @verbindung.ort }
    end

    assert_redirected_to verbindung_path(assigns(:verbindung))
  end

  test "should show verbindung" do
    get :show, id: @verbindung
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @verbindung
    assert_response :success
  end

  test "should update verbindung" do
    put :update, id: @verbindung, verbindung: { name: @verbindung.name, ort: @verbindung.ort }
    assert_redirected_to verbindung_path(assigns(:verbindung))
  end

  test "should destroy verbindung" do
    assert_difference('Verbindung.count', -1) do
      delete :destroy, id: @verbindung
    end

    assert_redirected_to verbindungs_path
  end
end
