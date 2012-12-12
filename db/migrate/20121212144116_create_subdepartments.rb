class CreateSubdepartments < ActiveRecord::Migration
  def change
    create_table :subdepartments do |t|
      t.string :name
      t.string :description
      t.integer :department_id

      t.timestamps
    end
  end
end
