class Purchase < ActiveRecord::Base
  extend FriendlyId

  has_many :line_items
  belongs_to :user

  validates :line_items, presence: { :message => 'there should be at least one line item' }
  validates :name, :date, presence: true

  friendly_id :name, use: :slugged

  accepts_nested_attributes_for :line_items, reject_if: :all_blank, allow_destroy: true

  def total
    line_items.map(&:amount).reduce(:+)
  end

  def title
    "#{name} $#{total}"
  end
end
