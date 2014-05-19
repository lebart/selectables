require 'test_helper'

module Selectables
  class SelectablesControllerTest < ActionController::TestCase
    setup do
      @selectable = selectables(:one)
    end

    test "should get index" do
      get :index
      assert_response :success
      assert_not_nil assigns(:selectables)
    end

    test "should get new" do
      get :new
      assert_response :success
    end

    test "should create selectable" do
      assert_difference('Selectable.count') do
        post :create, selectable: { category: @selectable.category, value: @selectable.value }
      end

      assert_redirected_to selectable_path(assigns(:selectable))
    end

    test "should show selectable" do
      get :show, id: @selectable
      assert_response :success
    end

    test "should get edit" do
      get :edit, id: @selectable
      assert_response :success
    end

    test "should update selectable" do
      patch :update, id: @selectable, selectable: { category: @selectable.category, value: @selectable.value }
      assert_redirected_to selectable_path(assigns(:selectable))
    end

    test "should destroy selectable" do
      assert_difference('Selectable.count', -1) do
        delete :destroy, id: @selectable
      end

      assert_redirected_to selectables_path
    end
  end
end
