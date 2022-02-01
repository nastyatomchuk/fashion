require 'csv'
require_relative './data//currency.csv.csv'
def seed_currency
  csv_file_path = './db/data/currency.csv'
  puts 'Seeding users from #{csv_file_path}...'
  f = File.new(csv_file_path, 'r')
  csv = CSV.new(f)
  headers = csv.shift

  csv.each do |row|
    currency_information = {
      entity: row[0],
      currency: row[1],
      alphabetic_code: row[2],
    }
    inv = Currency.create(currency_information)
  end
  puts 'Seeding users from #{csv_file_path} done.'
end
