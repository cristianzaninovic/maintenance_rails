require "application_system_test_case"

class MaintenanceMaterialListsTest < ApplicationSystemTestCase
  setup do
    @maintenance_material_list = maintenance_material_lists(:one)
  end

  test "visiting the index" do
    visit maintenance_material_lists_url
    assert_selector "h1", text: "Maintenance material lists"
  end

  test "should create maintenance material list" do
    visit maintenance_material_lists_url
    click_on "New maintenance material list"

    fill_in "Maintenance", with: @maintenance_material_list.maintenance_id
    fill_in "Material", with: @maintenance_material_list.material_id
    click_on "Create Maintenance material list"

    assert_text "Maintenance material list was successfully created"
    click_on "Back"
  end

  test "should update Maintenance material list" do
    visit maintenance_material_list_url(@maintenance_material_list)
    click_on "Edit this maintenance material list", match: :first

    fill_in "Maintenance", with: @maintenance_material_list.maintenance_id
    fill_in "Material", with: @maintenance_material_list.material_id
    click_on "Update Maintenance material list"

    assert_text "Maintenance material list was successfully updated"
    click_on "Back"
  end

  test "should destroy Maintenance material list" do
    visit maintenance_material_list_url(@maintenance_material_list)
    click_on "Destroy this maintenance material list", match: :first

    assert_text "Maintenance material list was successfully destroyed"
  end
end
