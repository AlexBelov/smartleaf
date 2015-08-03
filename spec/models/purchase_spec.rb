require 'rails_helper'

RSpec.describe Purchase, type: :model do
  it "should save purchase with at least one line_item" do
    line_item = LineItem.create(amount: 19.5)
    purchase = Purchase.create(name: 'name', line_items: [line_item])

    expect(purchase.line_items.count).to eq(1)
  end
end
