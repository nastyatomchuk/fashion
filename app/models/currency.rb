class Currency < ApplicationRecord
  has_many :currency_rates

  validates :country, :name, :code, presence: true
end
