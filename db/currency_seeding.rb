require_relative './data//currency.csv.csv'
def seed_currency
  csv_file_path = './db/data/currency.csv'
  csv_file = File.new(csv_file_path, 'r')
  csv_data = CSV.new(csv_file)

  csv_data.each do |row_data|
    currency_information = {
      entity: row_data[0],
      currency: row_data[1],
      alphabetic_code: row_data[2],
    }
    Currency.create(currency_information)
  end
end
