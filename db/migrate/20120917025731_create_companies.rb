class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :rif
      t.string :commercial_name
      t.string :fiscal_name
      t.string :description
      t.integer :user_id

      t.timestamps
    end
    add_index :companies, [:user_id]
  end
end
