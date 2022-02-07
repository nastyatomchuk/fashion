class CurrencyRate < ApplicationRecord
  belongs_to :source, foreign_key: "source_id", class_name: "Currency"
  belongs_to :target, foreign_key: "target_id", class_name: "Currency"

  validates :source, :target, presence: true
  validates :rate, presence: true, numericality: true
end
