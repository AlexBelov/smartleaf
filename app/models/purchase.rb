class Purchase < ActiveRecord::Base
  has_many :line_items
  validates :line_items, presence: { :message => 'there should be at least one line item' }
  validates :date, presence: true
end
