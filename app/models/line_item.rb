class LineItem < ActiveRecord::Base
  belongs_to :purchase
  validates :amount, presence: true
end
