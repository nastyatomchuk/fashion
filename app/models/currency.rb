class Currency < ApplicationRecord
  has_many :currency_rates

  validates :entity, :currency, :alphabetic_code, presence: true
end
