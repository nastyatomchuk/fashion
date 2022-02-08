class CurrencyRate < ApplicationRecord
  validates :source, :target, presence: true
  validates :rate, presence: true, numericality: { :greater_than_or_equal_to => 0, :less_than_or_equal_to => 100 }
end
