class CreateMaintenanceMaterialLists < ActiveRecord::Migration[7.0]
  def change
    create_table :maintenance_material_lists do |t|
      t.belongs_to :material, null: false, foreign_key: true
      t.belongs_to :maintenance, null: false, foreign_key: true

      t.timestamps
    end
  end
end
