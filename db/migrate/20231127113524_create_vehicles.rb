class CreateVehicles < ActiveRecord::Migration[7.1]
  def change
    create_table :vehicles, id: :uuid do |t|
      t.string :brand
      t.string :model
      t.integer :year, default: 0, null: false

      t.timestamps
    end
  end
end
