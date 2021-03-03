# テーブル設計

## users テーブル

| Column                  | Type    | Options      |
| --------                | ------  | -----------  |
| nickname                | string  | null: false  |
| email                   | string  | unique: true |
| encrypted_password      | string  | null: false  |
| familyname              | string  | null: false  |
| firstname               | string  | null: false  |
| familyname_kana         | string  | null: false  |
| firstname_kana          | string  | null: false  |
| birthday                | date    | null: false  |


### Association
- has_many : items
- belongs_to : buyers
- has_one : buyers

## items テーブル

| Column          | Type       | Options                        |
| --------------- | -----------| ------------------------------ |
| name            | text       | null: false                    |
| description     | text       | null: false                    |
| image           |            | ActiveStorageで実装            |
| category_id     | integer    | null: false, active_hashで実装 |
| shippingarea_id | integer    | null: false, active_hashで実装 |
| condition_id    | integer    | null: false, active_hashで実装 |
| shoppingday_id  | integer    | null: false, active_hashで実装 |
| price           | integer    | null: false                    |


### Association
- belongs_to : users
- belongs_to : buyers

## buyersテーブル

| Column   | Type         | Options                        |
| ------   | ---------- | ------------------------------ |
| user     | references | null: false, foreign_key: true |
| item     | references | null: false, foreign_key: true |


### Association
- has_many : items
- belongs_to : users
- belongs_to : shipping
- has_one : shopping

##  shippingテーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| postal_code  | integer    | null: false                    |
| prefecture_id| integer    | null: false, active_hashで実装 |
| city         | text       | null: false                    |
| address      | text       | null: false                    |
| building     | text       | null: false                    |
| phone_number | integer    | null: false                    |
| buyer        | reference  | null: false, foreign_key: true |
 

### Association
- belongs_to : buyers

