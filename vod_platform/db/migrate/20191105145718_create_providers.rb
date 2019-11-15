class CreateProviders < ActiveRecord::Migration[5.2]
  def change
    create_table :providers do |t|
      t.string :title, default: ""
      t.string :email, default: ""
      t.string :auth_token, default: ""
      t.string :slug, default: ""

      t.timestamps
    end
  end
end
