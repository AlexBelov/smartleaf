class Purchase < ActiveRecord::Base
  extend FriendlyId

  has_many :line_items
  belongs_to :user

  validates :line_items, presence: { :message => 'there should be at least one line item' }
  validates :date, presence: true

  friendly_id :name, use: :slugged
end
