class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
      t.integer :purchase_id
      t.float :amount
    end
  end
end
