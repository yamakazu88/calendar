## Usersテーブル

| Column             | Type     | Options                   |
|--------------------|----------|---------------------------|
| first_name         | string   | null: false               |
| last_name          | string   | null: false               |
| first_name_reading | string   | null: false               |
| last_name_reading  | string   | null: false               |
| nickname           | string   | null: false               |
| birthday           | date     | null: false               |
| email              | string   | null: false, unique: true |
| password           | string   | null: false               |

### Association

- has_many :posts



## Postsテーブル

| Column | Type       | Options           |
|--------|------------|-------------------|
| date   | date       | null: false       |
| title  | string     | null: false       |
| reason | string     | null: false       |
| memo   | text       | null: false       |
| user   | references | foreign_key: true |
|category| references | foreign_key: true |

### Association

- belongs_to :user
- belongs_to :category



## Categoriesテーブル

| Column | Type       | Options                   |
|--------|------------|---------------------------|
| name   | string     | null: false, unique: true |

### Association

- has_many :posts