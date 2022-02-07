class CurrencyRate < ApplicationRecord
  validates :source, :target, presence: true
  validates :rate, presence: true, numericality: true
end
