class CreateApps < ActiveRecord::Migration[5.2]
  def change
    create_table :apps do |t|
      t.string :title, default: ""
      t.string :description, default: ""
      t.integer :tenant_id, default: ""
      t.string :auth_token, default: ""

      t.timestamps
    end
  end
end
