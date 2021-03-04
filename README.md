# テーブル設計

## users テーブル

| Column                  | Type    | Options                   |
| --------                | ------  | ------------------------- |
| nickname                | string  | null: false               |
| email                   | string  | null: false, unique: true |
| encrypted_password      | string  | null: false               |
| familyname              | string  | null: false               |
| firstname               | string  | null: false               |
| familyname_kana         | string  | null: false               |
| firstname_kana          | string  | null: false               |
| birthdate               | date    | null: false               |


### Association
- has_many : items
- has_many : buyers

## items テーブル

| Column          | Type       | Options                        |
| --------------- | -----------| ------------------------------ |
| name            | string     | null: false                    |
| description     | text       | null: false                    |
| category_id     | integer    | null: false, active_hashで実装 |
| shippingarea_id | integer    | null: false, active_hashで実装 |
| condition_id    | integer    | null: false, active_hashで実装 |
| shippingday_id  | integer    | null: false, active_hashで実装 |
| price           | integer    | null: false                    |
| delivery_fee_id | integer    | null: false                    |
| user            | references | null: false, foreign_key: true |


### Association
- belongs_to : user
- has_one    : buyer

## buyersテーブル

| Column   | Type       | Options                        |
| ------   | ---------- | ------------------------------ |
| user     | references | null: false, foreign_key: true |
| item     | references | null: false, foreign_key: true |


### Association
- belongs_to : item
- belongs_to : user
- has_one    : shipping

##  shippingテーブル

| Column          | Type        | Options                        |
| --------------- | ----------- | ------------------------------ |
| postal_code     | string      | null: false                    |
| shippingarea_id | integer     | null: false, active_hashで実装 |
| city            | string      | null: false                    |
| address         | string      | null: false                    |
| building        | string      |                                |
| phone_number    | string      | null: false                    |
| buyer           | references  | null: false, foreign_key: true |
 

### Association
- belongs_to : buyer

