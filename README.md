# テーブル設計

## users テーブル

| Column                  | Type    | Options     |
| --------                | ------  | ----------- |
| nickname                | string  | null: false |
| email                   | string  | null: false |
| encrypted_password      | string  | null: false |
| familyname              | text    | null: false |
| firstname               | text    | null: false |
| familyname_kana         | text    | null: false |
| firstname_kana          | text    | null: false |
| birthday                | date    | null: false |


### Association
- has_many : items
- belongs_to : buyers
- has_one : buyers

## items テーブル

| Column        | Type       | Options                        |
| ------------- | -----------| ------------------------------ |
| name          | text       | null: false                    |
| description   | text       | null: false                    |
| image         | ActiveStorageで実装                         |
| category_id   | integer    | active_hashで実装              |
| shipping_area | string     | null: false                    |
| condition     | string     | null: false                    |
| shopping_day  | string     | null: false                    |
| price         | integer    | null: false                    |


### Association
- belongs_to : users
- belongs_to : buyers

## buyersテーブル

| Column   | Type      | Options                        |
| ------   | ----------| ------------------------------ |
| user     | reference | null: false, foreign_key: true |
| item     | reference | null: false, foreign_key: true |


### Association
- has_many : items
- belongs_to : users
- belongs_to : shipping
- has_one : shopping

##  shippingテーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| postal_code  | integer    | null: false                    |
| prefecture_id| integer    | active_hashで実装              |
| city         | text       | null: false                    |
| address      | text       | null: false                    |
| building     | text       | null: false                    |
| phone_number | integer    | null: false                    |
| buyer        | reference  | null: false, foreign_key: true |
 

### Association
- belongs_to : buyers

