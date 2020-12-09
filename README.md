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

### Association

- belongs_to :user
- has_many :post_category_relations
- has_many :categories, through: :post_category_relations



## Categoriesテーブル

| Column | Type       | Options                   |
|--------|------------|---------------------------|
| name   | string     | null: false, unique: true |

### Association

- has_many :post_category_relations
- has_many :posts, through: :post_category_relations



## Post_category_relationsテーブル（中間テーブル）

| Column   | Type       | Options           |
|----------|------------|-------------------|
| post     | references | foreign_key: true |
| category | references | foreign_key: true |

### Association

- belongs_to :post
- belongs_to :category