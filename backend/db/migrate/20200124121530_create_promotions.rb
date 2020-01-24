class CreatePromotions < ActiveRecord::Migration[5.2]
  def change
    create_table :promotions, id: :uuid do |t|
      t.string     :code
      t.boolean    :active
      t.integer    :discount

      t.timestamps
    end
  end
end
