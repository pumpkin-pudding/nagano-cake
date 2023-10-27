# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Customer.create(last_name: '田中',
                first_name: '愛子',
                last_name_kana: 'タナカ',
                first_name_kana: 'アイコ',
                zip_code: '1234567',
                address: 'テスト住所',
                phone_number: '08099990000',
                email: '123@gmail.com',
                password: 'abcdefg')

Customer.create(last_name: '田中',
                first_name: '愛子2',
                last_name_kana: 'タナカ',
                first_name_kana: 'アイコ2',
                zip_code: '1234568',
                address: 'テスト住所2',
                phone_number: '08099990001',
                email: '1234@gmail.com',
                password: 'abcdefg2')

Admin.create(email: '321@gmail.com',
            password: 'abcdefg3')

Genre.create(
  name: "ケーキ",
  )

Genre.create(
  name: "プリン",
  )

Genre.create(
  name: "焼き菓子",
  )

Genre.create(
  name: "キャンディ",
  )

Item.create(
  name: "ショートケーキ",
  text: "イチゴが乗ったショートケーキです",
  non_taxed_price: 500,
  genre_id: 1,
  is_active: true
)

Item.create(
  name: "かぼちゃプリン",
  text: "かぼちゃ味のプリンです",
  non_taxed_price: 400,
  genre_id: 2,
  is_active: true
)

Item.create!(genre_id: '1',
            name: 'ケーキ',
            text: 'testケーキ',
            is_active: 'true',
            non_taxed_price: '100',
            image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/logo.jpg")),filename: 'logo.jpg'))

Address.create(
  customer_id: 1,
  zip_code: '1234567',
  adress: 'テスト住所',
  name: '田中愛子'
)

Order.create(
  id
  customer_id
  name
  address
  zip_code
  
  
  
  )
