require 'csv'

unless Currency.exists?(country: 'BELARUS')
  puts "💸 Seeding currencies:"
  puts
  csv_text = File.read(Rails.root.join('db', 'data', 'currency.csv'))
  csv = CSV.parse(csv_text, headers: true, encoding: 'ISO-8859-1')
  csv.each do |row|
    сurrency_attrs = { country: row[0], name: row[1], code: row[2] }
    currency = Currency.create!(сurrency_attrs)
    puts "     #{currency.code} (#{currency.country})"
  end
  puts
end
