class AddColumnOrders < ActiveRecord::Migration[6.0]
  def up
    add_column :orders, :time, :string
  end
end
