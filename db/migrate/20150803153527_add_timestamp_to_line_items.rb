class AddTimestampToLineItems < ActiveRecord::Migration
  def change
    add_column :line_items, :created_at, :datetime
    add_column :line_items, :updated_at, :datetime
  end
end
