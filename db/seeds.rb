# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
n = 1
5.times do |user|
  user = User.create!(
    nickname: "ピカチュウ",
    last_name: "サトシ",
    first_name: "オオキド",
    last_name_ja: "さとし",
    first_name_ja: "おおきど",
    email: "satoshi#{n}@mail",
    postal_code: "123-4567",
    prefecture: rand(1..47),
    city: "渋谷区",
    address: "道玄坂",
    building: "フォンティスビル",
    phone_number: "08012345678",
    birthday: "1995-12-30",
    password: "password"
  )
  user.save!
  n += 1
end

require'csv'

csv_data = CSV.read('db/csv/categories.csv', headers: true)
csv_data.each do |data|
  Category.create!(data.to_hash)
end

csv_data = CSV.read('db/csv/brands.csv', headers: true)
csv_data.each do |data|
  Brand.create!(data.to_hash)
end

30.times do |number|
  n = number + 1
  product = Product.create!(
    name: "product_#{n}",
    detail: "#{n}detail#{n}",
    status: rand(1..6),
    delivery_fee: rand(1..2),
    area: rand(1..47),
    shipping_dates: rand(1..3),
    price: rand(1..9)*1000,
    delivery_status: 1,
    user_id: rand(1..5),
    brand_id: rand(1..10),
    category_id: rand(1..100)
  )
  product.save!
end
