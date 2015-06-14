class CreateIngredients < ActiveRecord::Migration
  def change
    create_table :ingredients do |t|
      t.string :name
      t.float :price
      t.belongs_to :pizza, index: true

      t.timestamps
    end
  end
end
