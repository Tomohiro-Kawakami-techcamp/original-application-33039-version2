class CreateAnotherFoods < ActiveRecord::Migration[6.0]
  def change
    create_table :another_foods do |t|
      t.string :name,      null: false
      t.integer :price,    null: false
      t.integer  :category_id,   null: false
      t.references :user,  foreign_key: true
      t.timestamps
    end
  end
end
