require 'csv'

unless Currency.exists?(entity: 'BELARUS')
  puts "💸 Seeding currencies:"
  puts
  csv_text = File.read(Rails.root.join('db', 'data', 'currency.csv'))
  csv = CSV.parse(csv_text, headers: true, encoding: 'ISO-8859-1')
  csv.each do |row|
    сurrency_attrs = { entity: row[0], currency: row[1], alphabetic_code: row[2] }
    currency = Currency.create!(сurrency_attrs)
    puts "     #{currency.alphabetic_code} (#{currency.currency})"
  end
  puts
end
