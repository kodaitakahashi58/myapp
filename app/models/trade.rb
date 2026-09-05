class Trade < ApplicationRecord
  belongs_to :user

  validates :stock_name, presence: true
  validates :stock_code, presence: true
  validates :trade_type, presence: true
  validates :shares, presence: true, numericality: { greater_than: 0 }
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :traded_on, presence: true
end
