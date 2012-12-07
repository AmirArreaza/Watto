class CreatePromotionTypes < ActiveRecord::Migration
  def change
    create_table :promotion_types do |t|
      t.decimal :price, :precision => 2, :scale => 2
      t.integer :duration
      t.string :banner

      t.timestamps
    end
  end
end
