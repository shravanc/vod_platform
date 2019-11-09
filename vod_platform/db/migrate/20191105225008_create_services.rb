class CreateServices < ActiveRecord::Migration[5.2]
  def change
    create_table :services do |t|
      t.json :system, array: true, defualt: []

      t.timestamps
    end
  end
end
