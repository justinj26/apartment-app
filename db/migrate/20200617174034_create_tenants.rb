class CreateTenants < ActiveRecord::Migration[5.2]
  def change
    create_table :tenants do |t|
      t.string :name 
      t.integer :apartment_id
    end
  end
end
