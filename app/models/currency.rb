class Currency < ApplicationRecord
  validates :entity, :currency, :alphabetic_code, presence: true
end
