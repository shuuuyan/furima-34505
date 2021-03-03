# テーブル設計

## users テーブル

| Column                  | Type    | Options     |
| --------                | ------  | ----------- |
| nickname                | string  | null: false |
| email                   | string  | null: false |
| password                | string  | null: false |
| password_confirmation   | string  | null: false |
| familyname              | text    | null: false |
| firstname               | text    | null: false |
| familyname_kana         | text    | null: false |
| firstname_kana          | text    | null: false |
| birthday                | integer | null: false |


### Association
- has_many : items
- belongs_to : buyers

## items テーブル

| Column        | Type       | Options                        |
| ------------- | -----------| ------------------------------ |
| name          | text       | null: false                    |
| description   | text       | null: false                    |
| image         | ActiveStorageで実装                         |
| category      | string     | null: false                    |
| shipping_area | string     | null: false                    |
| condition     | string     | null: false                    |
| shopping_day  | string     | null: false                    |
| price         | integer    | null: false                    |
| fee           | integer    | null: false                    |


### Association
- belongs_to : users
- belongs_to : buyers

## buyersテーブル

| Column | Type      | Options                        |
| ------ | ----------| ------------------------------ |
| user   | reference | null: false, foreign_key: true |
| name   | text      | null: false                    |

### Association
- has_many : items
- belongs_to : users
- belongs_to : shipping

##  shippingテーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| postal_code  | integer    | null: false                    |
| prefectures  | string     | null: false                    |
| city         | text       | null: false                    |
| address      | text       | null: false                    |
| phone_number | integer    | null: false                    |

### Association
- belongs_to : buyers

