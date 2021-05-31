class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :productcode
      t.string :title
      t.string :originalprice
      t.string :offer
      t.string :status

      t.timestamps null: false
    end
  end
end
