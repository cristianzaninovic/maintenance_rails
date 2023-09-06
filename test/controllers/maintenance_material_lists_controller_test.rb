require "test_helper"

class MaintenanceMaterialListsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @maintenance_material_list = maintenance_material_lists(:one)
  end

  test "should get index" do
    get maintenance_material_lists_url
    assert_response :success
  end

  test "should get new" do
    get new_maintenance_material_list_url
    assert_response :success
  end

  test "should create maintenance_material_list" do
    assert_difference("MaintenanceMaterialList.count") do
      post maintenance_material_lists_url, params: { maintenance_material_list: { maintenance_id: @maintenance_material_list.maintenance_id, material_id: @maintenance_material_list.material_id } }
    end

    assert_redirected_to maintenance_material_list_url(MaintenanceMaterialList.last)
  end

  test "should show maintenance_material_list" do
    get maintenance_material_list_url(@maintenance_material_list)
    assert_response :success
  end

  test "should get edit" do
    get edit_maintenance_material_list_url(@maintenance_material_list)
    assert_response :success
  end

  test "should update maintenance_material_list" do
    patch maintenance_material_list_url(@maintenance_material_list), params: { maintenance_material_list: { maintenance_id: @maintenance_material_list.maintenance_id, material_id: @maintenance_material_list.material_id } }
    assert_redirected_to maintenance_material_list_url(@maintenance_material_list)
  end

  test "should destroy maintenance_material_list" do
    assert_difference("MaintenanceMaterialList.count", -1) do
      delete maintenance_material_list_url(@maintenance_material_list)
    end

    assert_redirected_to maintenance_material_lists_url
  end
end
