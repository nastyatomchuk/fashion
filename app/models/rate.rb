class Rate < ActiveRecord::Base
  belongs_to :currency
  validates :rate, presence: true, numericality: true
end
