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
- has_many :conditions



## Postsテーブル

| Column     | Type       | Options           |
|------------|------------|-------------------|
| start_time | datetime   | null: false       |
| title      | string     | null: false       |
| reason     | string     | null: false       |
| memo       | text       | null: false       |
| user       | references | foreign_key: true |
|category    | references | foreign_key: true |

### Association

- belongs_to :user
- belongs_to :category



## Categoriesテーブル

| Column | Type       | Options                   |
|--------|------------|---------------------------|
| name   | string     | null: false, unique: true |

### Association

- has_many :posts


## Conditionsテーブル

| Column      | Type       | Options           |
|-------------|------------|-------------------|
| start_time  | datetime   | null: false       |
| temperature | integer    |                   |
| weight      | integer    |                   |
| blood_max   | integer    |                   |
| blood_min   | integer    |                   |
| condition   | integer    | null: false       |
| memo        | text       |                   |
| user        | references | foreign_key: true |

### Association

- belongs_to :user