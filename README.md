## Tabel名
users

|nickname          |string|null: false|
|email             |string|null: false|
|encrypted_password|string|null: false|
|name              |string|null: false|
|name_reading      |string|null: false|
|birthday          |integer|null: false|

### Association
has_many :itmes
has_one :purchases



## Tabel名
itmes

|product_name   |string|null: false|
|description    |text|null: false|
|product_type   |integer|null: false|
|product_status |integer|null: false|
|shipping_charge|integer|null: false|
|shipping_area  |integer|null: false|
|shipping_day   |integer|null: false|
|price|integer  |null: false|
|user|references|foreign_key: true|

### Association
belongs_to :user
has_one :purchases



## Tabel名
purchases

|user|references|foreign_key: true|
|item|references|foreign_key: true|

### Association
belongs_to :user
belongs_to :itmes
has_one :addresses


## Tabel名
addresses

|postal_code     |string|null: false|
|prefecture      |integer|null: false|
|city            |string|null: false|
|house_number    |string|null: false|
|building_name   |string|null: false|
|telephone_number|integer|null: false|
|purchase        |references|foreign_key: true|

### Association
belongs_to :purchases
