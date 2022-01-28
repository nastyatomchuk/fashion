require 'csv'

csv_text = File.read(Rails.root.join('db', 'data', 'currency.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  t = Currency.new
  t.entity = row[0]
  t.currency = row[1]
  t.alphabetic_code = row[2]
  t.save
end
