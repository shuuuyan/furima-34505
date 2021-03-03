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
- has_one : items
- has_one : buyer

## items テーブル

| Column          | Type       | Options                        |
| --------------- | -----------| ------------------------------ |
| name            | string     | null: false                    |
| description     | text       | null: false                    |
| category_id     | integer    | null: false, active_hashで実装 |
| shippingarea_id | integer    | null: false, active_hashで実装 |
| condition_id    | integer    | null: false, active_hashで実装 |
| shoppingday_id  | integer    | null: false, active_hashで実装 |
| price           | integer    | null: false                    |
| delivery_fee    | integer    | null: false                    |
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
- has_many   : items
- belongs_to : user
- has_one    : shopping

##  shippingテーブル

| Column       | Type        | Options                        |
| ------------ | ----------- | ------------------------------ |
| postal_code  | string      | null: false                    |
| prefecture_id| integer     | null: false, active_hashで実装 |
| city         | string      | null: false                    |
| address      | string      | null: false                    |
| building     | string      | null: false                    |
| phone_number | string      | null: false                    |
| buyer        | references  | null: false, foreign_key: true |
 

### Association
- belongs_to : buyer

