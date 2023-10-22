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

Genre.create(name: 'ケーキ')

Item.create!(genre_id: '1',
            name: 'ケーキ',
            text: 'testケーキ',
            is_active: 'true',
            non_taxed_price: '100',
            image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/logo.jpg")),filename: 'logo.jpg'))

CartItem.create(item_id: '1',
                customer_id: '1',
                amount: '5')

Order.create(customer_id: '1',
            name: 'aaaa',
            address: '東京都中央区銀座ああああああああああああ',
            zip_code: '1234567',
            postage: 'gtgtgtgt',
            billing_amount: '100000',
            payment_method: '1',
            status: '1')
