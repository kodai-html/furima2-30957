# テーブル設計

## Users テーブル

| Column               | Type   | Options      |
| -------------------- | ------ | -----------  |
| nickname             | string | null: false  |
| email                | string | unique: true |
| encrypted_password   | string | null: false  |
| last_name            | string | null: false  |
| first_name           | string | null: false  |
| kana_last            | string | null: false  |
| kana_first           | string | null: false  |
| birth_day            | date   | null: false  |

### Association

- has_many :items
- has_many :orders

## Items テーブル

| Column        | Type    | Options     |
| ------------- | ------- | ----------- |
| name          | string  | null: false |
| explain       | text    | null: false |
| category_id   | integer | null: false |
| state_id      | integer | null: false |
| burden_id     | integer | null: false |
| prefecture_id | integer | null: false |
| date_id       | integer | null: false |
| price         | integer | null: false |

### Association

- belongs_to :user
- has_one :order

## orders テーブル

| Column   | Type      | Options           |
| -------- | --------- | ----------------- |
| item     | reference | foreign_key: true |
| buyer    | reference | foreign_key: true |
| address  | reference | foreign_key: true |
### Association

- has_one :address
- belongs_to :item
- belongs_to :user

## Addresses テーブル

| Column        | Type    | Options     |
| ------------- | ------- | ----------- |
| postal_code   | string  | null: false | 
| prefecture_id | integer | null: false |
| municipality  | string  | null: false |
| address       | string  | null: false |
| building      | string  |  |
| number        | string  | null: false |

### Association

- belongs_to :order