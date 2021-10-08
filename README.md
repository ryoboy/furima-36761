## Tabel名
users

|Colum             |Type   |Options                                |
|------------------|-------|---------------------------------------|
|nickname          |string |null: false                            |
|email             |string |null: false, default: "", unique: true |
|encrypted_password|string |null: false                            |
|first_name        |string |null: false                            | #姓のカラム
|name              |string |null: false                            | #名のカラム
|first_name_reading|string |null: false                            | #性のカナのカラム
|name_reading      |string |null: false                            | #名のカナのカラム
|birthday          |date   |null: false                            |

### Association
has_many :items
has_many :purchases



## Tabel名
items

|Column            |Type      |Options                       |
|------------------|----------|------------------------------|
|product_name      |string    |null: false                   |
|description       |text      |null: false                   |
|product_type_id   |integer   |null: false                   |
|product_status_id |integer   |null: false                   |
|shipping_charge_id|integer   |null: false                   |
|shipping_area_id  |integer   |null: false                   |
|shipping_day_id   |integer   |null: false                   |
|price             |integer   |null: false                   |
|user              |references|null: false, foreign_key: true|

### Association
belongs_to :user
has_one :purchase



## Tabel名
purchases

|Column|Type      |Options                       |
|------|----------|------------------------------|
|user  |references|null: false, foreign_key: true|
|item  |references|null: false, foreign_key: true|

### Association
belongs_to :user
belongs_to :item
has_one :address


## Tabel名
addresses

|Column                |Type      |Options                       |
|----------------------|----------|------------------------------|
|postal_code           |string    |null: false                   |
|shipping_area_id      |integer   |null: false                   |
|city                  |string    |null: false                   |
|house_number          |string    |null: false                   |
|building_name         |string    |                              |
|telephone_number      |string    |null: false                   |
|purchase              |references|null: false, foreign_key: true|

### Association
belongs_to :purchase
